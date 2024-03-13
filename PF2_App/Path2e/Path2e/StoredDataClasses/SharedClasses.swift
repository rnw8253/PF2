//
//  SharedClasses.swift
//  PF2_API
//
//  Created by Ryan Weber on 7/7/23.
//

import Foundation
import SwiftUI
import RealmSwift


class Coding: Object, Identifiable {
    @Persisted var modification: RealmSwift.List<Modification>
    @Persisted var temporaryModification: RealmSwift.List<TemporaryModification>
    @Persisted var temporaryEffect: RealmSwift.List<TemporaryEffects>
    @Persisted var conditionalChange: RealmSwift.List<ConditionalChanges>
    @Persisted var conditionals: RealmSwift.List<ConditionalChanges>
    @Persisted var feat: Feat? = nil
    @Persisted var skill: Skill? = nil
    @Persisted var spell: Spell? = nil
    @Persisted var weaponAndArmor: WeaponAndArmor? = nil
    @Persisted var other: Other? = nil
    @Persisted var feature: Feature? = nil
}

// PROFICIENCY
class Proficiency: Object, Identifiable {
    @Persisted var type: String
    @Persisted var name: String?
    @Persisted var prof: String
}
// OTHER
class Other: Object, Identifiable {
    @Persisted var setVariable: RealmSwift.List<SetVariable>
    @Persisted var giveNotesField: RealmSwift.List<String>
    @Persisted var addText: RealmSwift.List<String>
    @Persisted var giveCurseCounter: Bool = false
    @Persisted var givePanacheButton: Bool = false
    @Persisted var addEidolon: Bool = false
}


class SetVariable: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int? = nil
    @Persisted var other: String? = nil
}
// FEATURES
class Feature: Object, Identifiable {
    @Persisted var giveSpeed: RealmSwift.List<GiveSpeed>
    @Persisted var giveSense: RealmSwift.List<String>
    @Persisted var givePhysicalFeature: RealmSwift.List<String>
    @Persisted var giveClassFeature: RealmSwift.List<String>
    @Persisted var giveHeritageEffectAncestry: String? = nil
    @Persisted var giveCharacterTrait: RealmSwift.List<String>
    @Persisted var giveCharacterTraitCommon: Bool = false
    @Persisted var giveDomain: GiveDomain? = nil
    @Persisted var giveDomainAdvancement: String? = nil
    @Persisted var chooseDeityType: String? = nil
    @Persisted var giveDivineFont: String? = nil
    @Persisted var giveResistance: RealmSwift.List<Resistance>
    @Persisted var giveWeakness: RealmSwift.List<Weakness>
    @Persisted var setKeyAbility: RealmSwift.List<String>
    @Persisted var setSize: String? = nil
    @Persisted var giveDragonType: String? = nil
    @Persisted var giveAbilityBoost: Int = 0
    @Persisted var giveCondition: PlayerCondition? = nil
    @Persisted var giveRageCondition: PlayerCondition? = nil
    @Persisted var giveLanguage: RealmSwift.List<String>
    @Persisted var chooseLang: Int = 0
    @Persisted var giveApexAbilityScore: RealmSwift.List<String>
    @Persisted var giveAlchemistProgression: Bool = false
    @Persisted var advancedAlchemy: Int? = nil
    @Persisted var giveSCFS: String?
    @Persisted var giveLangBonusOnly: Bool = false
    @Persisted var increasePanacheSpeed: Int? = nil
    @Persisted var proficiencies: RealmSwift.List<Proficiency>
}
class GiveDomain: Object, Identifiable {
    @Persisted var type: String
    @Persisted var domains: RealmSwift.List<String>
}
class PlayerCondition: Object, Identifiable {
    @Persisted var name: String
    @Persisted var value: Int? = nil
}
class Resistance: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int?
    @Persisted var halfLevel: Bool = false
    @Persisted var level: Bool = false
    @Persisted var addConMod: Bool = false
}
class Weakness: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int?
    @Persisted var halfLevel: Bool = false
}
class GiveSpeed: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int? = nil
    @Persisted var landSpeed: Bool = false
}
// WEAPONS AND ARMOR
class WeaponAndArmor: Object, Identifiable {
    @Persisted var setMightyBulwark: Bool = false
    @Persisted var setArmorStealth: Bool = false
    @Persisted var giveArmorSpecialization: RealmSwift.List<ArmorSpecialization>
    @Persisted var setUnburdenedIron: Bool = false
    @Persisted var giveWeaponFamiliarity: RealmSwift.List<String>
    @Persisted var improvisedWeaponNoPenalty: Bool = false
    @Persisted var giveWeaponCriticalSpecialization: RealmSwift.List<WeaponCriticalizationSpecialization>
    @Persisted var setTier2Agile: Bool = false
    @Persisted var addLevelToUntrainedWeapons = false
    @Persisted var defaultWeaponRune: RealmSwift.List<String>
    @Persisted var defaultArmorRune: RealmSwift.List<String>
    @Persisted var addItemToBag: RealmSwift.List<String>
    @Persisted var onHitDamage: String? = nil
    @Persisted var onHitOther: String? = nil
    @Persisted var onHitConditional: String? = nil
    @Persisted var onCritOther: String? = nil
    @Persisted var onCritConditional: String? = nil
    @Persisted var overrideArmorCheckPenalty: Int? = nil
    @Persisted var overrideArmorSpeedPenalty: Int? = nil
    @Persisted var giveWeaponSpecialization: Bool = false
    @Persisted var giveGreaterWeaponSpecialization: Bool = false
    @Persisted var setFinesseMeleeDamageAsDex: Bool = false
    @Persisted var increaseDeificWeaponDamge: Bool = false
    @Persisted var giveRageAttack: RealmSwift.List<Int>
    @Persisted var chooseRageWeapon: Bool = false
    @Persisted var upgradeUnarmedAttackDice: Bool = false
    @Persisted var increaseRageDamage: Int? = nil
    @Persisted var chooseAlchemicalFormulas: ChooseFormulas? = nil
    @Persisted var convertAlchemicalItemDCtoClassDC: Bool = false
    @Persisted var chooseFieldFormulas: FieldFormulas? = nil
    @Persisted var weaponProficiencies: RealmSwift.List<Proficiency>
    @Persisted var armorProficiencies: RealmSwift.List<Proficiency>
}
class FieldFormulas: Object, Identifiable {
    @Persisted var type: String
    @Persisted var count: Int
}
class ChooseFormulas: Object, Identifiable {
    @Persisted var count: Int
    @Persisted var level: Int
}
class WeaponCriticalizationSpecialization: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: String
}
class ArmorSpecialization: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: String?
}
// SPELLS
class Spell: Object, Identifiable {
    @Persisted var giveSpellSlot: RealmSwift.List<SpellSlot>
    @Persisted var giveSpell: RealmSwift.List<GiveSpell>
    @Persisted var giveFocusPoint: Bool = false
    @Persisted var setSpellKeyAbility: String? = nil
    @Persisted var setSpellCastingType: String? = nil
    @Persisted var setSpellTradition: String? = nil
    @Persisted var chooseSpell: RealmSwift.List<ChooseSpell>
    @Persisted var addSpellToList: RealmSwift.List<GiveSpell>
    @Persisted var setSpellSlots: String? = nil
    @Persisted var chooseSchoolSpell: String? = nil
    @Persisted var signatureSpells: Bool = false
    @Persisted var unlimitedSignatureSpells: Bool = true
    @Persisted var chooseSpellFromList: RealmSwift.List<ChooseSpellFromList>
    @Persisted var spellProficiencies: RealmSwift.List<Proficiency>
}
class ChooseSpellFromList: Object, Identifiable {
    @Persisted var options: RealmSwift.List<String>
}
class GiveSpell: Object, Identifiable {
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var tradition: String? = nil
    @Persisted var level: Int? = nil
    @Persisted var usesPerDay: Int? = nil
}
class ChooseSpell: Object, Identifiable {
    @Persisted var level: Int
    @Persisted var tradition: String
    @Persisted var usesPerDay: Int
}
class SpellSlot: Object, Identifiable {
    @Persisted var type: String
    @Persisted var level: Int
}
// SKILLS
class Skill: Object, Identifiable {
    @Persisted var giveLore: RealmSwift.List<String>
    @Persisted var choose: RealmSwift.List<String>
    @Persisted var chooseFromList: RealmSwift.List<ChooseSkillFromList>
    @Persisted var chooseLore: Int = 0
    @Persisted var chooseLoreIncreasing: Int = 0
    @Persisted var addLevelToUntrainedSkills: Bool = false
    @Persisted var giveSkillIncrease: Int = 0
    @Persisted var skillProficiencies: RealmSwift.List<Proficiency>
}
class ChooseSkillFromList: Object, Identifiable {
    @Persisted var prof: String
    @Persisted var skills: RealmSwift.List<String>
}
// FEATS
class Feat: Object, Identifiable {
    @Persisted var choose: RealmSwift.List<ChooseFeat>
    @Persisted var chooseFromList: RealmSwift.List<ChooseFeatFromList>
    @Persisted var give: RealmSwift.List<String>
    @Persisted var overrideFeatLevel: OverrideFeatLevel? = nil
}
class OverrideFeatLevel: Object, Identifiable {
    @Persisted var name: String
    @Persisted var level: Int
}
class ChooseFeat: Object, Identifiable {
    @Persisted var type: String
    @Persisted var className: String? = nil
    @Persisted var level: Int?
    @Persisted var currentLevel: Bool = false
    @Persisted var halfLevel: Bool = false
}
class ChooseFeatFromList: Object, Identifiable {
    @Persisted var choice: String
    @Persisted var options: RealmSwift.List<String>
}
// MODIFICATIONS
class Modification: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name : String? = nil
    @Persisted var value: Int? = nil
    @Persisted var valueTimesTwo: Bool = false
    @Persisted var valueTimesLevel: Bool = false
    @Persisted var level: Bool = false
    @Persisted var type: String?
    @Persisted var isPenalty: Bool = false
}
// TEMPORARY MODIFICATIONS
class TemporaryModification: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name: String?
    @Persisted var value: Int
    @Persisted var condition: String
}
// TEMPORARY EFFECTS
class TemporaryEffects: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name: String? = nil
    @Persisted var effect: String
}
// CONDITIONAL CHANGES
class ConditionalChanges: Object, Identifiable {
    // Condition
    @Persisted var hasLevelGreaterThan: Int? = nil
    @Persisted var hasLevelLessThan: Int? = nil
    @Persisted var hasLevel: Int? = nil
    @Persisted var hasClassAbility: RealmSwift.List<String>
    @Persisted var doesNothaveClassAbility: RealmSwift.List<String>
    @Persisted var hasFeat: RealmSwift.List<String>
    @Persisted var doesNotHaveFeat: RealmSwift.List<String>
    @Persisted var doesNotHaveFocusPoint: Bool
    @Persisted var hasProfOrHigher: RealmSwift.List<Proficiency>
    @Persisted var hasProf: RealmSwift.List<Proficiency>
    @Persisted var hasHeritage: RealmSwift.List<String>
    @Persisted var inOverdrive: Bool = false
    @Persisted var inRage: Bool = false
    @Persisted var isUnarmored: Bool = false
    @Persisted var hasLowLightVision: Bool = false
    // IF-Change
    @Persisted var addText: String? = nil
    @Persisted var giveFeatName: String? = nil
    @Persisted var giveSpellSlot: SpellSlot? = nil
    @Persisted var giveProficiency: Proficiency? = nil
    @Persisted var giveSpell: GiveSpell? = nil
    @Persisted var chooseSpell: ChooseSpell? = nil
    @Persisted var giveFocusPoint: Bool = false
    @Persisted var setVariable: SetVariable? = nil
    @Persisted var modification: Modification? = nil
    @Persisted var giveSpeed: GiveSpeed? = nil
    @Persisted var giveResistance: Resistance? = nil
    @Persisted var upgradeVision: Bool = false
    @Persisted var skillIncrease: Int = 0
    @Persisted var giveWeaponCriticalSpecialization: WeaponCriticalizationSpecialization? = nil
    @Persisted var givePhysicalFeatureName: String? = nil
    @Persisted var chooseFeat: ChooseFeat? = nil
    @Persisted var chooseLanguage: Int = 0
    @Persisted var chooseLore: Int = 0
    @Persisted var chooseSkill: String? = nil
    @Persisted var chooseSkillFromList: ChooseSkillFromList? = nil
    @Persisted var tempAttackDamageBonus: String? = nil
    @Persisted var temporaryModification: TemporaryModification? = nil
    @Persisted var tempSaveReflex: String?
    @Persisted var tempSaveWill: String?
    @Persisted var tempSaveFort: String?
    @Persisted var addSpellToList: GiveSpell? = nil
    @Persisted var chooseFeatFromList: ChooseFeatFromList? = nil
    @Persisted var giveArmorSpecialization: ArmorSpecialization? = nil
    @Persisted var setMAP: String? = nil
    @Persisted var increaseRageAttackDamage: Int? = nil
    @Persisted var increaseRageDamage: Int? = nil
    @Persisted var upgradeRageAttack: Bool = false
    @Persisted var chooseRageWeapon: Bool = false
    @Persisted var increaseRageWeaponDamage: Int? = nil
    // ELSE-Change
    @Persisted var elseGiveFeatName: String? = nil
    @Persisted var elseGiveLore: String? = nil
    @Persisted var elseGiveProficiency: Proficiency? = nil
    @Persisted var elseGiveLowLightVision: Bool = false
    @Persisted var elseChooseSkill: String? = nil
    @Persisted var elseChooseSkillFromList: ChooseSkillFromList? = nil
    @Persisted var elseChooseFeatFromList: ChooseFeatFromList? = nil
    @Persisted var elseGiveSpeed: GiveSpeed? = nil
    @Persisted var elseGiveSpell: GiveSpell? = nil
    @Persisted var elseSetVariable: SetVariable? = nil
    @Persisted var elseTemporaryModifications: TemporaryModification? = nil
}
// SAVE FEATS
class SaveFeats: Object, Identifiable {
    @Persisted var name: String
    @Persisted var level: Int
}
class ArchetypeFeats: Object, Identifiable {
    @Persisted var archetype: String
    @Persisted var feats: RealmSwift.List<SaveFeats>
}




