#include "ScriptMgr.h"
#include "Chat.h"
#include "Config.h"
#include "Language.h"
#include "LFGMgr.h"
#include "Group.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "SystemConfig.h"
#include "AvgDiffTracker.h"

class PB_commandscript : public CommandScript
{
public:
    PB_commandscript() : CommandScript("PB_commandscript") { }
    /* ------------------------------------------------------------------------- */
    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> westmereCommandTable =
        {
            { "damage",                             SEC_ADMINISTRATOR, false, &HandleWestmereDamage,     ""},
            { "maxlevel",                           SEC_ADMINISTRATOR, false, &HandleWestmereMaxLevel,   ""},
            { "minlevel",                           SEC_ADMINISTRATOR, false, &HandleWestmereMinLevel,   ""}, 
            
        };

        static std::vector<ChatCommand> CommandTable =
        {
            { "se",            SEC_PLAYER,             true,  NULL,                                "", westmereCommandTable }, 
        };
        
        return CommandTable;
    }

    /* ------------------------------------------------------------------------- */
    /*                     COMMAND SCRIPTS BELONG BELOW THIS LINE                */
    /* ------------------------------------------------------------------------- */

    static bool HandleWestmereDamage(ChatHandler* handler, char const* args)
    {
        if (Player* plr = handler->GetSession()->GetPlayer())
            if (!plr->HasAura(68378) || !plr->HasAura(64238) || !plr->HasAura(62555) || !plr->HasAura(62560))
            {
                plr->AddAura(68378, plr);
                plr->AddAura(64238, plr);
                plr->AddAura(62555, plr);
                plr->AddAura(62560, plr);
                handler->PSendSysMessage("Your damage has been buffed, if you don't need that much simply right-click the auras we have added you.");
            }
            else handler->PSendSysMessage("Please remove all of your damage modifiers before using this command.");

        return true;
    }

    static bool HandleWestmereMinLevel(ChatHandler* handler, char const* args)
    {
        if (Player* plr = handler->GetSession()->GetPlayer())
        {
            plr->SetLevel(1);
            handler->PSendSysMessage("Your level has been set to 1, if you want to be 80 please use the command \".westmere maxlevel\".");
        }

        return true;
    }

    static bool HandleWestmereMaxLevel(ChatHandler* handler, char const* args)
    {
        if (Player* plr = handler->GetSession()->GetPlayer())
        {
            plr->SetLevel(80);
            handler->PSendSysMessage("Your level has been set to 80, if you want to be 1 please use the command \".westmere minlevel\".");
        }

        return true;
    }
};

void AddSC_PB_commandscript()
{
    new PB_commandscript();
}
