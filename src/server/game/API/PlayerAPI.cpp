#include "PlayerAPI.h"
#include "Player.h"
#include "Log.h"

PlayerAPI::PlayerAPI() { }

void PlayerAPI::DeletePlayer(uint64 guid)
{
    PreparedStatement* stmt = stmt = APIDatabase.GetPreparedStatement(API_DEL_CHAR_STATS);
    stmt->setUInt32(0, guid);

    APIDatabase.Execute(stmt);
    sLog->outAPI("Deleted entry %u from API database, characters table.", guid);
}
 
void PlayerAPI::UpdatePlayer(Player* player, uint16 achPts)
{ 
    PreparedStatement* stmt = APIDatabase.GetPreparedStatement(API_INS_CHAR_STATS);
    uint8 index = 0;

    stmt->setUInt32(index++, player->GetGUIDLow());
    stmt->setUInt32(index++, player->GetMaxHealth());

    for (uint8 i = 0; i < MAX_POWERS; ++i)
        stmt->setUInt32(index++, player->GetMaxPower(Powers(i)));

    for (uint8 i = 0; i < MAX_STATS; ++i)
        stmt->setUInt32(index++, player->GetStat(Stats(i)));

    for (int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        stmt->setUInt32(index++, player->GetResistance(SpellSchools(i)));

    // stats
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_BLOCK_PERCENTAGE));
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_DODGE_PERCENTAGE));
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_PARRY_PERCENTAGE));
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_CRIT_PERCENTAGE));
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_RANGED_CRIT_PERCENTAGE));
    stmt->setFloat(index++, player->GetFloatValue(PLAYER_SPELL_CRIT_PERCENTAGE1));
    stmt->setUInt32(index++, player->GetUInt32Value(UNIT_FIELD_ATTACK_POWER));
    stmt->setUInt32(index++, player->GetUInt32Value(UNIT_FIELD_RANGED_ATTACK_POWER));
    stmt->setUInt32(index++, player->GetBaseSpellPowerBonus());
    stmt->setUInt32(index++, player->GetUInt32Value(PLAYER_FIELD_COMBAT_RATING_1 + CR_CRIT_TAKEN_SPELL));

    // ach pts
    stmt->setUInt32(index++, achPts);

    // name, guildname, active spec
    stmt->setString(index++, player->GetName());
    if (player->GetGuild())
    {
        stmt->setString(index++, player->GetGuildName());
        stmt->setUInt32(index++, player->GetGuildId());
    }
    else
    {
        stmt->setString(index++, "");
        stmt->setUInt32(index++, 0);
    }
    stmt->setUInt32(index++, player->GetActiveSpec());

    // location
    stmt->setUInt32(index++, player->GetMapId());
    stmt->setUInt32(index++, player->GetZoneId());
    stmt->setUInt32(index++, player->GetAreaId());
     
    // Save Arena Teams (2v2, 3v3, 5v5)
    stmt->setUInt32(index++, player->GetArenaTeamId(0));
    stmt->setUInt32(index++, player->GetArenaTeamId(1));
    stmt->setUInt32(index++, player->GetArenaTeamId(2));

    // race, class
    stmt->setUInt32(index++, player->getRace());
    stmt->setUInt32(index++, player->getClass());
    stmt->setUInt32(index++, player->getGender());

    // 6 entries for glyphs
    for (uint8 i = 0; i < 6; ++i)
    {
        if (uint32 glyph = player->GetGlyph(i)) stmt->setUInt32(index++, player->GetGlyph(i));
        else stmt->setUInt32(index++, 0);
    }

    // level, hp, power
    stmt->setUInt32(index++, player->getLevel());

    // played time, level played time
    stmt->setUInt32(index++, player->GetTotalPlayedTime());
    stmt->setUInt32(index++, player->GetLevelPlayedTime());

    // money
    stmt->setUInt32(index++, player->GetMoney());
    sLog->outString("INDEX IS: %u", index);
    APIDatabase.Execute(stmt);
    sLog->outAPI("[PlayerAPI] Updated stats for player %s(%u).", player->GetName().c_str(), player->GetGUIDLow());
}