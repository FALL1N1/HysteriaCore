#include "ScriptPch.h" 
#include "ArenaTeam.h"
#include "ArenaTeamMgr.h"
#include "Player.h"
#include "Battleground.h" 

//#define sArenaTeamMgr ACE_Singleton<ArenaTeamMgr, ACE_Null_Mutex>::instance()

class MMRCommandScript : public CommandScript
{
public:
	MMRCommandScript() : CommandScript("MMRCommandScript") {}
    ChatCommand* GetCommands() const override
    {
        static ChatCommand mmrCTB[] =
        {
            { "reset", SEC_PLAYER, true, &HandleMMRResetCommand, "", NULL }, 
            { NULL, 0, false, NULL, "", NULL }
        };
        static ChatCommand commandTable[] =
        {
            { "mmr", SEC_PLAYER, true, NULL, "", mmrCTB },
            { NULL, 0, false, NULL, "", NULL }
        };
        return commandTable;
    }

    
	static bool HandleMMRResetCommand(ChatHandler* handler, const char* args)
    {
        if (Player* me = handler->GetSession()->GetPlayer())
        { 
            for (uint8 slot = 0; slot <= 2; ++slot)
                if (uint32 arenaTeamId = Player::GetArenaTeamIdFromStorage(me->GetGUIDLow(), slot))
                { 
                    if (ArenaTeam *team = sArenaTeamMgr->GetArenaTeamById(arenaTeamId))
                    {
                        if (ArenaTeamMember* member = team->GetMember(me->GetGUID()))
                        {
                            int32 mod = sWorld->getIntConfig(CONFIG_ARENA_START_MATCHMAKER_RATING) - member->MatchMakerRating;
                            member->MatchMakerRating = mod;
                            member->ModifyMatchmakerRating(mod, slot);
                            team->SaveToDB();
                        } 
                    }
                }
            me->GetSession()->SendNotification("Your MMR Rating has been reset!");
        }
        return true;
	}
 
};

void AddSC_MMRCommandScript()
{
    new MMRCommandScript();
}










