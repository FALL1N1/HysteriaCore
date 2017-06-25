#include "ScriptMgr.h"
#include "Chat.h"
#include "Language.h"
#include "LFGMgr.h"
#include "Group.h"
#include "Player.h"

class firefly_commandscript : public CommandScript
{
public:
    firefly_commandscript() : CommandScript("firefly_commandscript") { }
    /* ------------------------------------------------------------------------- */
    ChatCommand* GetCommands() const
    {
        ChatCommand static fireflyCommandTable[] =
        {
            { "damage",                             SEC_ADMINISTRATOR, false, &HandleFireFlyDamage,   "", NULL },
            { "maxlevel",                           SEC_ADMINISTRATOR, false, &HandleFireFlyMaxLevel, "", NULL },
            { "minlevel",                           SEC_ADMINISTRATOR, false, &HandleFireFlyMinLevel, "", NULL },
            { NULL,                                 0,                 false, NULL,                   "", NULL }
        };

        static ChatCommand commandTable[] =
        {
            { "firefly",            SEC_ADMINISTRATOR,      true,  NULL,                                "", fireflyCommandTable },
            {  NULL,                SEC_PLAYER,             false, NULL,                                "", NULL }
        };
        
        return commandTable;
    }

    /* ------------------------------------------------------------------------- */
    /*                     COMMAND SCRIPTS BELONG BELOW THIS LINE                */
    /* ------------------------------------------------------------------------- */

    static bool HandleFireFlyDamage(ChatHandler* handler, char const* args)
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

    static bool HandleFireFlyMinLevel(ChatHandler* handler, char const* args)
    {
        if (Player* plr = handler->GetSession()->GetPlayer())
        {
            plr->SetLevel(1);
            handler->PSendSysMessage("Your level has been set to 1, if you want to be 80 please use the command \".firefly maxlevel\".");
        }

        return true;
    }

    static bool HandleFireFlyMaxLevel(ChatHandler* handler, char const* args)
    {
        if (Player* plr = handler->GetSession()->GetPlayer())
        {
            plr->SetLevel(80);
            handler->PSendSysMessage("Your level has been set to 80, if you want to be 1 please use the command \".firefly minlevel\".");
        }

        return true;
    }
};

void AddSC_firefly_commandscript()
{
    new firefly_commandscript();
}
