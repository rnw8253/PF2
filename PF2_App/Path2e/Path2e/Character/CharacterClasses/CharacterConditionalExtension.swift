//
//  CharacterConditionalExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 10/19/23.
//

import Foundation
import RealmSwift

class CharacterConditionalChange: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var containerKey: ObjectId
    @Persisted var containsSelection: Bool = false
    @Persisted var selectedLevel: Int? = nil
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
    
    // IF-CHANGE
    @Persisted var giveProficiency: Proficiency? = nil
    @Persisted var modification: Modification? = nil
    @Persisted var temporaryModification: TemporaryModification? = nil
    @Persisted var tempSaveReflex: String?
    @Persisted var tempSaveWill: String?
    @Persisted var tempSaveFort: String?
    // -- Feature --
    @Persisted var upgradeVision: Bool = false
    @Persisted var language: String? = nil
    @Persisted var giveSpeed: GiveSpeed? = nil
    @Persisted var giveResistance: Resistance? = nil
    @Persisted var physicalFeature: String? = nil
    // -- Feat --
    @Persisted var feat: CharacterFeat? = nil
    // -- Spell --
    @Persisted var spellSlot: SpellSlot? = nil
    @Persisted var spell: CharacterSpell? = nil
    @Persisted var giveFocusPoint: Bool = false
    @Persisted var addSpellToList: CharacterSpell? = nil
    // -- Skill --
    @Persisted var skill: CharacterSkill? = nil
    // -- Weapon and Armor
    @Persisted var tempAttackDamageBonus: String? = nil
    @Persisted var weaponCriticalSpecialization: CharacterWeaponCriticalizationSpecialization? = nil
    @Persisted var armorSpecialization: CharacterArmorSpecialization? = nil
    @Persisted var setMAP: String? = nil
    @Persisted var increaseRageAttackDamage: Int? = nil
    @Persisted var increaseRageDamage: Int? = nil
    @Persisted var upgradeRageAttack: Bool = false
    @Persisted var increaseRageWeaponDamage: Int? = nil
    // -- Other --
    @Persisted var setVariable: SetVariable? = nil
    @Persisted var addText: String? = nil
    
    // ELSE-CHANGE
    @Persisted var elseFeat: CharacterFeat? = nil
    @Persisted var elseSkill: CharacterSkill? = nil
    @Persisted var elseProficiency: Proficiency? = nil
    @Persisted var elseGiveLowLightVision: Bool = false
    @Persisted var elseGiveSpeed: GiveSpeed? = nil
    @Persisted var elseGiveSpell: GiveSpell? = nil
    @Persisted var elseSetVariable: SetVariable? = nil
    @Persisted var elseTemporaryModifications: TemporaryModification? = nil
}


