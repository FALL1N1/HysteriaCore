#include "APIDatabase.h"

void APIDatabaseConnection::DoPrepareStatements()
{
    if (!m_reconnecting)
        m_stmts.resize(MAX_APIDATABASE_STATEMENTS);

    // PlayerAPI
    PrepareStatement(API_DEL_CHAR_STATS, "DELETE FROM characters WHERE guid = ?", CONNECTION_ASYNC);
    PrepareStatement(API_INS_CHAR_STATS, "REPLACE INTO characters ("
        "guid, maxhealth, maxpower1, maxpower2, maxpower3, maxpower4, maxpower5, maxpower6, maxpower7, strength, "
        "agility, stamina, intellect, spirit, armor, resHoly, resFire, resNature, resFrost, resShadow, "
        "resArcane, blockPct, dodgePct, parryPct, critPct, rangedCritPct, spellCritPct, attackPower, rangedAttackPower, spellPower, "
        "resilience, achievementPoints, name, guildname, guildid, activespec, map, zone, area, lastseen, "
        "2v2, 3v3, 5v5, race, class, gender, glyph1, glyph2, glyph3, glyph4, "
        "glyph5, glyph6, level, totaltime, leveltime, money)"
        " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", CONNECTION_ASYNC);

    // ArenaAPI

    PrepareStatement(API_INS_ARENA_GAME, "INSERT INTO arena_fights VALUES (?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", CONNECTION_ASYNC);

    PrepareStatement(API_INS_ARENA_MEMBERSTATS, "REPLACE INTO arena_memberstats  (fight_id, member_id, name, guid, team, account, ip, damage, heal, kblows) VALUES("
                                         "?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", CONNECTION_ASYNC);

}
