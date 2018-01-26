#include "ScriptPch.h"
#include "ArenaTeam.h"
#include "Player.h"
#include "Battleground.h"

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
        Player* me = handler->GetSession()->GetPlayer();
        //me->SetArenaMatchmakerRating(sWorld->getIntConfig(CONFIG_ARENA_START_MATCHMAKER_RATING) - member->MatchMakerRating, slot);
        me->GetSession()->SendNotification("Your MMR Rating has been reset!");
        return true;
	}
 
};

void AddSC_MMRCommandScript()
{
    new MMRCommandScript();
}