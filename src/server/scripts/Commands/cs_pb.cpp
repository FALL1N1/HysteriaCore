#include "ScriptMgr.h"
#include "Chat.h"
#include "Language.h"
#include "LFGMgr.h"
#include "Group.h"
#include "Player.h"
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
            { "statistics",                         SEC_PLAYER,        false, &HandleWestmereStatistics, ""},
            
        };

        static std::vector<ChatCommand> CommandTable =
        {
            { "help",            SEC_PLAYER,             true,  NULL,                                "", westmereCommandTable }, 
        };
        
        return CommandTable;
    }

    /* ------------------------------------------------------------------------- */
    /*                     COMMAND SCRIPTS BELONG BELOW THIS LINE                */
    /* ------------------------------------------------------------------------- */

    static bool HandleWestmereStatistics(ChatHandler* handler, char const* args)
    {
        std::string realmName = sWorld->GetRealmName();
        uint32 playerCount = sWorld->GetPlayerCount();
        uint32 activeSessionCount = sWorld->GetActiveSessionCount();
        uint32 queuedSessionCount = sWorld->GetQueuedSessionCount();
        uint32 connPeak = sWorld->GetMaxActiveSessionCount();
        
        uint32 int_h = 0;
        uint32 int_a = 0;
        
        std::string uptime = secsToTimeString(sWorld->GetUptime()).append(".");
        std::string cur_rev = "00000000";
        uint32 updateTime = sWorld->GetUpdateTime();
        uint32 avgUpdateTime = avgDiffTracker.getAverage();
        /* let's generate our output */
        handler->PSendSysMessage("-------------------");
        handler->PSendSysMessage("|cff3a8edbProject \"Balnazzar\"|r, Current Patch: 3.0 - Echoes of Doom (Naxxramas)");
        handler->PSendSysMessage("Total: |cff3E9448%u|r | Ingame: |cff3E9448%u|r | Ever: |cff3E9448315|r | Today: |cff3E9448%u|r", activeSessionCount, playerCount, connPeak);
        handler->PSendSysMessage("Horde has |cffFF0000%u|r online. Alliance has |cff0000FF%u|r online.", int_h, int_a);
        handler->PSendSysMessage("Server uptime is: |cff3E9448%s|r", uptime.c_str());

        if (sWorld->IsShuttingDown())
            handler->PSendSysMessage("Realm will be |cffFF0000taken down for updates|r, time left till restart: |cffFF0000%s|r", secsToTimeString(sWorld->GetShutDownTimeLeft()).append(".").c_str());
        handler->PSendSysMessage("-------------------");
        return true;
    }

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
