/*


 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ByteBuffer.h"
#include "TargetedMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "Transport.h"
#include "CreatureAI.h"
#include "World.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Player.h"
#include "PathGenerator.h"
#include "VehicleDefines.h"

template<class T, typename D>
void TargetedMovementGeneratorMedium<T, D>::_setTargetLocation(T* owner, bool updateDestination)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return;

    if (owner->GetTypeId() != TYPEID_PLAYER && owner->HasUnitState(UNIT_STATE_CASTING))
        return;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
        return;

    if (owner->IsMovementPreventedByCasting())
        return;

    // allow pets to use shortcut if no path found when following their master
    bool forceDest = (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->IsPet()
        && owner->HasUnitState(UNIT_STATE_FOLLOW));

    if (owner->GetTypeId() == TYPEID_UNIT && !forceDest && !i_target->isInAccessiblePlaceFor(owner->ToCreature()))
        return;

    float x, y, z;

    if (updateDestination || !i_path)
    {
        if (!i_offset)
        {
            if (i_target->IsWithinDistInMap(owner, CONTACT_DISTANCE))
                return;

            // to nearest contact position
            i_target->GetContactPoint(owner, x, y, z);
        }
        else
        {
            float dist;
            float size;

            if (owner->IsPet())
            {
                if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
                {
                    dist = 1.0f;
                    size = 1.0f;
                }
                else if (GetTarget()->GetVictim() != owner) // if pet is not the target's victim
                    i_angle = float(M_PI); // then pet goes for the back
                else
                    i_angle = 0.f; // else pet goes for the front
            }
            else
            {
                dist = i_offset + 1.0f;
                size = owner->GetCombatReach();
            }

            if (i_target->IsWithinDistInMap(owner, dist))
                return;

            // to at i_offset distance from target and i_angle from target facing
            i_target->GetClosePoint(x, y, z, size, i_offset, i_angle);
        }
    }
    else
    {
        // the destination has not changed, we just need to refresh the path (usually speed change)
        G3D::Vector3 end = i_path->GetEndPosition();
        x = end.x;
        y = end.y;
        z = end.z;
    }

    if (!i_path)
        i_path = new PathGenerator(owner);

    bool result = i_path->CalculatePath(x, y, z, forceDest);
    if (!result || (i_path->GetPathType() & PATHFIND_NOPATH))
    {
        // can't reach target
        i_recalculateTravel = true;
        return;
    }

    D::_addUnitStateMove(owner);
    i_targetReached = false;
    i_recalculateTravel = false;
    owner->AddUnitState(UNIT_STATE_CHASE);

    Movement::MoveSplineInit init(owner);
    init.MovebyPath(i_path->GetPath());
    init.SetWalk(((D*)this)->EnableWalking());
    init.Launch();
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T, D>::DoUpdate(T* owner, uint32 time_diff)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return false;

    if (!owner || !owner->IsAlive())
        return false;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
    if (owner->IsMovementPreventedByCasting())
    {
        if (!owner->IsStopped())
            owner->StopMoving();
        return true;
    }

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    bool targetMoved = false;
    bool targetStoped = false;
    i_recheckDistance.Update(time_diff);
    if (i_recheckDistance.Passed())
    {
        i_recheckDistance.Reset(100);
        float allowed_dist = i_offset ? i_offset : CONTACT_DISTANCE;

        if (!owner->GetMap()->IsBattlegroundOrArena())
            allowed_dist += sWorld->getRate(RATE_TARGET_POS_RECALCULATION_RANGE);
        else
            allowed_dist += CONTACT_DISTANCE;

        if (!owner->HasUnitState(UNIT_STATE_FOLLOW))
            allowed_dist += owner->GetCombatReach();

        G3D::Vector3 dest = owner->movespline->FinalDestination();
        if (owner->movespline->onTransport)
            if (TransportBase* transport = owner->GetDirectTransport())
                transport->CalculatePassengerPosition(dest.x, dest.y, dest.z);

        if (owner->GetTypeId() == TYPEID_UNIT && (owner->ToCreature()->CanFly() || owner->ToCreature()->CanSwim()))
            targetMoved = !i_target->IsWithinDist3d(dest.x, dest.y, dest.z, allowed_dist);
        else
            targetMoved = !i_target->IsWithinDist2d(dest.x, dest.y, allowed_dist);

        if (i_path && targetMoved)
            targetMoved = !i_path->IsOffMeshPoint(owner->movespline->currentPathIdx()) && !i_path->IsOffMeshPoint(owner->movespline->currentPathIdx() + 1);
    }

    if (i_recalculateTravel || targetMoved || (i_recalculateSpeed && (owner->GetTypeId() != TYPEID_UNIT || !owner->ToCreature()->IsPet())))
        _setTargetLocation(owner, targetMoved);

    if (owner->movespline->Finalized())
    {
        static_cast<D*>(this)->MovementInform(owner);

        if (!i_targetReached)
        {
            i_targetReached = true;
            static_cast<D*>(this)->_reachTarget(owner);
        }

        if (!i_targetStoped)
        {
            if (owner->HasUnitState(UNIT_STATE_FOLLOW))
                _setTargetLocation(owner, true);
            i_targetStoped = true;
        }

        if (i_path)
            i_path->Clear();
    }
    else
        i_targetStoped = false;

    return true;
}

//-----------------------------------------------//
template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T* owner)
{
    _clearUnitStateMove(owner);
    if (owner->IsWithinMeleeRange(this->i_target.getTarget()))
        owner->Attack(this->i_target.getTarget(), true);
}

template<>
void ChaseMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<>
void ChaseMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->SetWalk(false);
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<class T>
void ChaseMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void ChaseMovementGenerator<T>::MovementInform(T* /*unit*/) { }

template<>
void ChaseMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AI()->MovementInform(CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template<>
bool FollowMovementGenerator<Creature>::EnableWalking() const
{
    return i_target.isValid() && i_target->IsWalking();
}

template<>
bool FollowMovementGenerator<Player>::EnableWalking() const
{
    return false;
}

template<class T>
void FollowMovementGenerator<T>::_reachTarget(T* /*unit*/) { }

template<>
void FollowMovementGenerator<Creature>::_reachTarget(Creature* owner)
{
    if (owner->IsPet())
        owner->SetFacingTo(i_target->GetOrientation());
}

template<>
void FollowMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _setTargetLocation(owner, true);
}

template<>
void FollowMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _setTargetLocation(owner, true);
}

template<class T>
void FollowMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    owner->StopMoving();
}

template<class T>
void FollowMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void FollowMovementGenerator<T>::MovementInform(T* /*unit*/) { }

template<>
void FollowMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AI()->MovementInform(FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::_setTargetLocation(Player*, bool);
template void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::_setTargetLocation(Player*, bool);
template void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool);
template void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool);
template bool TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);
template bool TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);

template void ChaseMovementGenerator<Player>::_reachTarget(Player*);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature*);
template void ChaseMovementGenerator<Player>::DoFinalize(Player*);
template void ChaseMovementGenerator<Creature>::DoFinalize(Creature*);
template void ChaseMovementGenerator<Player>::DoReset(Player*);
template void ChaseMovementGenerator<Creature>::DoReset(Creature*);
template void ChaseMovementGenerator<Player>::MovementInform(Player*);

template void FollowMovementGenerator<Player>::_reachTarget(Player*);
template void FollowMovementGenerator<Player>::DoFinalize(Player*);
template void FollowMovementGenerator<Creature>::DoFinalize(Creature*);
template void FollowMovementGenerator<Player>::DoReset(Player*);
template void FollowMovementGenerator<Creature>::DoReset(Creature*);
template void FollowMovementGenerator<Player>::MovementInform(Player*);
