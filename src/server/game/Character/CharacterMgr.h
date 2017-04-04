// BY MACZUGA

#ifndef TRINITY_CHARACTERMGR_H
#define TRINITY_CHARACTERMGR_H

#include <ace/Singleton.h>
#include "Common.h"
#include "DatabaseEnv.h"

struct CharacterTemplate
{
    uint32 id;
    std::string name;
    uint8  level;
    uint32 money;
};

struct CharacterTemplateItem
{
    CharacterTemplateItem(uint32 TemplateID, uint32 ItemID, uint32 Count)
    {
        templateId = TemplateID;
        itemId = ItemID;
        count = Count;
    }

    uint32 templateId;
    uint32 itemId;
    uint32 count;
};

struct CharacterTemplateSpell
{
    CharacterTemplateSpell(uint32 TemplateID, uint32 SpellID)
    {
        templateId = TemplateID;
        spellId = SpellID;
    }

    uint32 templateId;
    uint32 spellId;
};

typedef std::unordered_map<uint32, CharacterTemplate> CharacterTemplateStore;
typedef std::vector<CharacterTemplateItem*> CharacterTemplateItemStore;
typedef std::unordered_map<uint32 /* templateID */, CharacterTemplateItemStore > CharacterTemplateItemsStore;
typedef std::vector<CharacterTemplateSpell*> CharacterTemplateSpellStore;
typedef std::unordered_map<uint32 /* templateID */, CharacterTemplateSpellStore > CharacterTemplateSpellsStore;

class CharacterMgr
{
    friend class ACE_Singleton<CharacterMgr, ACE_Null_Mutex>;

    private:
        CharacterMgr();
        ~CharacterMgr();

        CharacterTemplateStore _templates;
        CharacterTemplateItemsStore _items;
        CharacterTemplateSpellsStore _spells;


    public:
        void LoadFromDB();

        CharacterTemplateStore const* GetCharacterTemplateStore() const { return &_templates; }
        CharacterTemplateItemStore const& GetCharacterTemplateItems(uint32 templateId);
        CharacterTemplateSpellStore const& GetCharacterTemplateSpells(uint32 templateId);

        CharacterTemplate const* GetCharacterTemplate(uint32 entry);
};

#define sCharacterMgr ACE_Singleton<CharacterMgr, ACE_Null_Mutex>::instance()

#endif
