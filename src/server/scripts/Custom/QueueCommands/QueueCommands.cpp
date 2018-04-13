#include "ScriptPch.h"
#include "Battleground.h"
#include "ArenaTeam.h"
#include "BattlegroundMgr.h"
#include "WorldSession.h"

class QueueCommandScript : public CommandScript
{
public:
	QueueCommandScript() : CommandScript("QueueCommandScript") {}
    ChatCommand* GetCommands() const override
    {
        static ChatCommand queueCTB[] =
        {
            { "2v2", SEC_PLAYER, true, &HandleQueue2v2Command, "", NULL },
            { "3v3", SEC_PLAYER, true, &HandleQueue3v3Command, "", NULL },
            { "solo", SEC_PLAYER, true, &HandleQueueSoloCommand, "", NULL },
            { NULL, 0, false, NULL, "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "join", SEC_PLAYER, true, NULL, "", queueCTB },
            { NULL, 0, false, NULL, "", NULL }
        };
        return commandTable;
    }

    
	static bool HandleQueueSoloCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CUSTOM_SCRIPTS_ENABLED_OR_NOT))
            return false;

        Player* me = handler->GetSession()->GetPlayer(); 
        uint32 err = 0;
        
        if (me->InBattleground()) // currently in battleground
            err = ERR_BATTLEGROUND_NOT_IN_BATTLEGROUND;
        else if (me->isUsingLfg()) // using lfg system
            err = ERR_LFG_CANT_USE_BATTLEGROUND;
        else if (!me->CanJoinToBattleground()) // has deserter debuff
            err = ERR_GROUP_JOIN_BATTLEGROUND_DESERTERS;
        else if (me->InBattlegroundQueue()) // already in queue, so can't queue for random
            err = ERR_IN_NON_RANDOM_BG;
        else if (me->InBattlegroundQueueForBattlegroundQueueType(BATTLEGROUND_QUEUE_2v2) ||
                 me->InBattlegroundQueueForBattlegroundQueueType(BATTLEGROUND_QUEUE_3v3) ||
                 me->InBattlegroundQueueForBattlegroundQueueType(BATTLEGROUND_QUEUE_5v5)) // can't be already queued for arenas
            err = ERR_BATTLEGROUND_QUEUED_FOR_RATED;

        if (err <= 0)
        { 
            return true;
        } else me->AddBattlegroundQueueId(BATTLEGROUND_QUEUE_2v2);
          
        return true;
	}
    
    static bool HandleQueue2v2Command(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CUSTOM_SCRIPTS_ENABLED_OR_NOT))
            return false;

        Player* me = handler->GetSession()->GetPlayer();
        if(me->GetArenaTeamId(1) != 0)
        {
            me->AddBattlegroundQueueId(BATTLEGROUND_QUEUE_2v2);
        }
        else
        {
            handler->PSendSysMessage("You are not in an Arena Team!");
        }
        return true;
	}
    
	static bool HandleQueue3v3Command(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CUSTOM_SCRIPTS_ENABLED_OR_NOT))
            return false;

        Player* me = handler->GetSession()->GetPlayer();
        if(me->GetArenaTeamId(2) != 0)
        {
            me->AddBattlegroundQueueId(BATTLEGROUND_QUEUE_3v3);
        }
        else
        {
            handler->PSendSysMessage("You are not in an Arena Team!");
        }
        return true;
	}
    
};

void AddSC_QueueCommandScript()
{
    new QueueCommandScript();
}