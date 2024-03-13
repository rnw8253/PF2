//
//  GiveCharacterEffect.swift
//  Path2e
//
//  Created by Ryan Weber on 7/29/23.
//

import Foundation
import RealmSwift

class CharacterEffects: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var containerKey: ObjectId
    @Persisted var modification: RealmSwift.List<CharacterModification>
    @Persisted var temporaryModification: RealmSwift.List<CharacterTemporaryModification>
    @Persisted var temporaryEffect: RealmSwift.List<CharacterTemporaryEffects>
    //MARK: FEATURE
    @Persisted var giveSpeed: RealmSwift.List<CharacterGiveSpeed>
    @Persisted var giveSense: RealmSwift.List<String>
    @Persisted var givePhysicalFeature: RealmSwift.List<String>
    @Persisted var classFeatures: RealmSwift.List<ClassAbility>
    @Persisted var traits: RealmSwift.List<String>
    @Persisted var domain: Int? = nil
    @Persisted var domainAdvancement: Int? = nil
    @Persisted var deity: Int? = nil
    @Persisted var giveDivineFont: String? = nil
    @Persisted var giveResistance: RealmSwift.List<CharacterResistance>
    @Persisted var giveWeakness: RealmSwift.List<CharacterWeakness>
    @Persisted var keyAbility: String? = nil
    @Persisted var setSize: String? = nil
    @Persisted var giveDragonType: String? = nil
    @Persisted var giveCondition: CharacterPlayerCondition? = nil
    @Persisted var languages: RealmSwift.List<String>
    @Persisted var giveApexAbilityScore: RealmSwift.List<String>
    @Persisted var giveAlchemistProgression: Bool = false
    @Persisted var abilityBoost: RealmSwift.List<String>
    @Persisted var advancedAlchemy: Int? = nil
    @Persisted var giveLangBonusOnly: Bool = false
    @Persisted var increasePanacheSpeed: Int? = nil
    @Persisted var otherProficiency: RealmSwift.List<CharacterProficiency>
    //MARK: WEAPON, ARMOR, AND ATTACKS
    @Persisted var setMightyBulwark: Bool = false
    @Persisted var setArmorStealth: Bool = false
    @Persisted var giveArmorSpecialization: RealmSwift.List<CharacterArmorSpecialization>
    @Persisted var setUnburdenedIron: Bool = false
    @Persisted var giveWeaponFamiliarity: RealmSwift.List<String>
    @Persisted var improvisedWeaponNoPenalty: Bool = false
    @Persisted var giveWeaponCriticalSpecialization: RealmSwift.List<CharacterWeaponCriticalizationSpecialization>
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
    @Persisted var rageWeapon: Int? = nil
    @Persisted var upgradeUnarmedAttackDice: Bool = false
    @Persisted var increaseRageDamage: Int? = nil
    @Persisted var alchemicalFormulas: RealmSwift.List<Int>
    @Persisted var fieldFormulas: RealmSwift.List<Int>
    @Persisted var convertAlchemicalItemDCtoClassDC: Bool = false
    @Persisted var giveRageCondition: CharacterPlayerCondition? = nil
    @Persisted var armorProficiencies: RealmSwift.List<CharacterProficiency>
    @Persisted var weaponProficiencies: RealmSwift.List<CharacterProficiency>
    //MARK: SPELLS
    @Persisted var spellSlot: RealmSwift.List<SpellSlot>
    @Persisted var spell: RealmSwift.List<CharacterSpell>
    @Persisted var addSpellToList: RealmSwift.List<CharacterSpell>
    @Persisted var giveFocusPoint: Bool = false
    @Persisted var setSpellSlots: SetSpellSlots? = nil
    @Persisted var signatureSpells: Bool = false
    @Persisted var spellProficiency: RealmSwift.List<CharacterProficiency>
    //MARK: SKILLS
    @Persisted var skills: RealmSwift.List<CharacterSkill>
    @Persisted var loreIncreasing: RealmSwift.List<String>
    @Persisted var addLevelToUntrainedSkills: Bool = false
    //MARK: FEATS
    @Persisted var feats: RealmSwift.List<CharacterFeat>
//    @Persisted var overrideFeatLevel: OverrideFeatLevel? = nil
    //MARK: CONDITIONALS
    @Persisted var conditionalChanges: RealmSwift.List<CharacterConditionalChange>
    //MARK: OTHER
    @Persisted var setVariable: RealmSwift.List<SetVariable>
    @Persisted var giveNotesField: RealmSwift.List<String>
    @Persisted var addText: RealmSwift.List<String>
    @Persisted var giveCurseCounter: Bool = false
    @Persisted var givePanacheButton: Bool = false
    @Persisted var addEidolon: Bool = false
}
class SetSpellSlots: Object, Identifiable {
    @Persisted var castingType: String? = nil
    @Persisted var spellSlots: String? = nil
    @Persisted var tradition: String? = nil
    @Persisted var school: String? = nil
    @Persisted var keyAbility: String? = nil
    @Persisted var unlimitedSignatureSpells: Bool = false
}
class CharacterSpell: Object, Identifiable {
    @Persisted var spell: String? = nil
    @Persisted var type: String? = nil
    @Persisted var tradition: String? = nil
    @Persisted var level: Int? = nil
    @Persisted var usesPerDay: Int? = nil
}
class CharacterSkill: Object, Identifiable {
    @Persisted var skill: String
    @Persisted var prof: String
}

class CharacterPlayerCondition: Object, Identifiable {
    @Persisted var name: String
    @Persisted var value: Int? = nil
}

class CharacterWeaponCriticalizationSpecialization: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: String
}

class CharacterArmorSpecialization: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: String?
}

class CharacterResistance: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int?
    @Persisted var halfLevel: Bool = false
    @Persisted var level: Bool = false
    @Persisted var addConMod: Bool = false
}

class CharacterWeakness: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int?
    @Persisted var halfLevel: Bool = false
}

class CharacterGiveSpeed: Object, Identifiable {
    @Persisted var type: String
    @Persisted var value: Int?
    @Persisted var landSpeed: Bool = false
}

class CharacterProficiency: Object, Identifiable {
    @Persisted var type: String
    @Persisted var name: String?
    @Persisted var prof: String
}

class CharacterModification: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name : String? = nil
    @Persisted var value: Int? = nil
    @Persisted var valueTimesTwo: Bool = false
    @Persisted var valueTimesLevel: Bool = false
    @Persisted var level: Bool = false
    @Persisted var type: String?
    @Persisted var isPenalty: Bool = false
}

class CharacterTemporaryModification: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name: String?
    @Persisted var value: Int
    @Persisted var condition: String
}
class CharacterTemporaryEffects: Object, Identifiable {
    @Persisted var category: String
    @Persisted var name: String? = nil
    @Persisted var effect: String
}
