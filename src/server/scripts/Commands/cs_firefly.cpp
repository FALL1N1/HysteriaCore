#include "ScriptMgr.h"
#include "Chat.h"
#include "Language.h"
#include "LFGMgr.h"
#include "Group.h"
#include "Player.h"
#include "AvgDiffTracker.h"

class firefly_commandscript : public CommandScript
{
public:
    firefly_commandscript() : CommandScript("firefly_commandscript") { }
    /* ------------------------------------------------------------------------- */
    ChatCommand* GetCommands() const
    {
        ChatCommand static fireflyCommandTable[] =
        {
            { "damage",                             SEC_ADMINISTRATOR, false, &HandleFireFlyDamage,     "", NULL },
            { "maxlevel",                           SEC_ADMINISTRATOR, false, &HandleFireFlyMaxLevel,   "", NULL },
            { "minlevel",                           SEC_ADMINISTRATOR, false, &HandleFireFlyMinLevel,   "", NULL },
            { "statistics",                         SEC_PLAYER,        false, &HandleFireFlyStatistics, "", NULL },
            { NULL,                                 0,                 false, NULL,                     "", NULL }
        };

        static ChatCommand commandTable[] =
        {
            { "firefly",            SEC_PLAYER,             true,  NULL,                                "", fireflyCommandTable },
            {  NULL,                SEC_PLAYER,             false, NULL,                                "", NULL }
        };
        
        return commandTable;
    }

    /* ------------------------------------------------------------------------- */
    /*                     COMMAND SCRIPTS BELONG BELOW THIS LINE                */
    /* ------------------------------------------------------------------------- */

    static bool HandleFireFlyStatistics(ChatHandler* handler, char const* args)
    {
        std::string realmName = sWorld->GetRealmName();
        uint32 playerCount = sWorld->GetPlayerCount();
        uint32 activeSessionCount = sWorld->GetActiveSessionCount();
        uint32 queuedSessionCount = sWorld->GetQueuedSessionCount();
        uint32 connPeak = sWorld->GetMaxActiveSessionCount();
        std::string uptime = secsToTimeString(sWorld->GetUptime()).append(".");
        std::string cur_rev = "99cb6a13ba";
        uint32 updateTime = sWorld->GetUpdateTime();
        uint32 avgUpdateTime = avgDiffTracker.getAverage();
        /* let's generate our output */
        handler->PSendSysMessage("-------------------");
        handler->PSendSysMessage("|cff3a8edbFirefly WoW|r, revision: |cff3E9448%s|r", cur_rev.c_str()); if (!queuedSessionCount)
            // -- //
            handler->PSendSysMessage("[PLAYERS] Total: |cff3E9448%u|r | Ingame: |cff3E9448%u|r | Ever: |cff3E9448315|r", activeSessionCount, playerCount); else
            handler->PSendSysMessage("[PLAYERS] Total: |cff3E9448%u|r | Ingame: |cff3E9448%u|r | Ever: |cff3E9448315|r | Queue: |cff3E9448%u|r", activeSessionCount, playerCount, queuedSessionCount);
            // -- //
        handler->PSendSysMessage("Online Peak: |cff3E9448%u|r | Ever: |cff3E9448315|r", connPeak);
        handler->PSendSysMessage("Server uptime is: |cff3E9448%s|r", uptime.c_str());

        if (sWorld->IsShuttingDown())
            handler->PSendSysMessage("|cffFF0000Realm will be taken down for update, time left: %s|r", secsToTimeString(sWorld->GetShutDownTimeLeft()).append(".").c_str());
        handler->PSendSysMessage("-------------------");
        return true;
    }

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
