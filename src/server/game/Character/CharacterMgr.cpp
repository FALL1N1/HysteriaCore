// BY MACZUGA

#include "CharacterMgr.h"
#include "Timer.h"
#include "DBCEnums.h"
#include "Item.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"

CharacterMgr::CharacterMgr() { }

CharacterMgr::~CharacterMgr()
{
}

CharacterTemplate const* CharacterMgr::GetCharacterTemplate(uint32 id)
{
    CharacterTemplateStore::const_iterator itr = _templates.find(id);
    if (itr != _templates.end())
        return &(itr->second);

    return nullptr;
}

void CharacterMgr::LoadFromDB()
{
    uint32 oldMSTime = getMSTime();

    uint32 count = 0;

    //                                               0   1     2      3
    QueryResult result = WorldDatabase.Query("SELECT Id, Name, Level, Money FROM character_template");

    if (!result)
    {
        sLog->outString(">> Loaded 0 character templates. DB table `character_template` is empty.");
        return;
    }

    _templates.rehash(result->GetRowCount());
    do
    {
        Field* fields = result->Fetch();

        uint32 id = fields[0].GetUInt32();
        std::string name = fields[1].GetString();
        uint8 level = fields[2].GetUInt8();
        uint32 money = fields[3].GetUInt32();

        if (level < 1)
        {
            sLog->outErrorDb("Table `character_template` has template (ID: %u) with too low level. Setting to 1.", id);
            level = 1;
        }

        if (level > DEFAULT_MAX_LEVEL)
        {
            sLog->outErrorDb("Table `character_template` has template (ID: %u) with too high level. Setting to %u.", id, uint8(DEFAULT_MAX_LEVEL));
            level = DEFAULT_MAX_LEVEL;
        }

        CharacterTemplate& charTemplate = _templates[id];

        charTemplate.id = id;
        charTemplate.name = name;
        charTemplate.level = level;
        charTemplate.money = money;

        ++count;
    } while (result->NextRow());

    sLog->outString(">> Loaded %u character templates in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog->outString();

    oldMSTime = getMSTime();

    count = 0;

    //                                   0           1       2
    result = WorldDatabase.Query("SELECT TemplateID, ItemID, Count FROM character_template_item");

    if (!result)
    {
        sLog->outString(">> Loaded 0 character template items. DB table `character_template_item` is empty.");
        return;
    }

    do
    {
        Field* fields = result->Fetch();

        uint32 templateId = fields[0].GetUInt32();
        uint32 itemId = fields[1].GetUInt32();
        uint32 itemCount = fields[2].GetUInt32();

        CharacterTemplate const* templateInfo = GetCharacterTemplate(templateId);
        if (!templateInfo)
        {
            sLog->outError("Table `character_template_item` has data for nonexistent character template (template: %u, item: %u), skipped", templateId, itemId);
            continue;
        }

        ItemTemplate const* itemInfo = sObjectMgr->GetItemTemplate(itemId);
        if (!itemInfo)
        {
            sLog->outError("Table `character_template_item` has data for nonexistent item (template: %u, item: %u), skipped", templateId, itemId);
            continue;
        }

        if (itemCount < 1)
        {
            sLog->outErrorDb("Table `character_template_item` has template (template: %u, item: %u) with too count = 0. Setting to 1.", templateId, itemId);
            itemCount = 1;
        }

        CharacterTemplateItem* item = new CharacterTemplateItem(templateId, itemId, itemCount);
        _items[templateId].push_back(item);

        ++count;
    } while (result->NextRow());

    sLog->outString(">> Loaded %u character template items in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog->outString();

    oldMSTime = getMSTime();

    count = 0;

    //                                   0           1
    result = WorldDatabase.Query("SELECT TemplateID, SpellID FROM character_template_spell");

    if (!result)
    {
        sLog->outString(">> Loaded 0 character template spells. DB table `character_template_spell` is empty.");
        return;
    }

    do
    {
        Field* fields = result->Fetch();

        uint32 templateId = fields[0].GetUInt32();
        uint32 spellId = fields[1].GetUInt32();

        CharacterTemplate const* templateInfo = GetCharacterTemplate(templateId);
        if (!templateInfo)
        {
            sLog->outError("Table `character_template_spell` has data for nonexistent character template (template: %u, spell: %u), skipped", templateId, spellId);
            continue;
        }

        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
        if (!spellInfo)
        {
            sLog->outError("Table `character_template_spell` has data for nonexistent spell (template: %u, spell: %u), skipped", templateId, spellId);
            continue;
        }

        CharacterTemplateSpell* spell = new CharacterTemplateSpell(templateId, spellId);
        _spells[templateId].push_back(spell);

        ++count;
    } while (result->NextRow());

    sLog->outString(">> Loaded %u character template spells in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog->outString();
}

CharacterTemplateItemStore const& CharacterMgr::GetCharacterTemplateItems(uint32 templateId)
{
    return _items[templateId];
}

CharacterTemplateSpellStore const& CharacterMgr::GetCharacterTemplateSpells(uint32 templateId)
{
    return _spells[templateId];
}
