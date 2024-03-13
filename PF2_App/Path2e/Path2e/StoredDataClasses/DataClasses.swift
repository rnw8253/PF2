//
//  DataClasses.swift
//  PF2_API
//
//  Created by Ryan Weber on 7/7/23.
//

import Foundation
import SwiftUI
import RealmSwift

// Condition Data
class ConditionData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var hasValue: Bool
    @Persisted var descriptions: String
    @Persisted var effects: Coding? = nil
}
// Trait Data
class TraitData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = TraitData()
        copy.id = id
        copy.name = name
        copy.descriptions = descriptions
        return copy
    }
}
// Feat Data
class FeatData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var level: Int
    @Persisted var rarity: String
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
    @Persisted var genTypeName: String?
    @Persisted var genericType: String?
    @Persisted var skillID: Int?
    @Persisted var actions: String?
    @Persisted var cost: String?
    @Persisted var frequency: String?
    @Persisted var prerequisites: String?
    @Persisted var requirements: String?
    @Persisted var special: String?
    @Persisted var trigger: String?
    @Persisted var traits: RealmSwift.List<Int>
    @Persisted var effects: Coding? = nil
}
// Archetype Data
class ArchetypeData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var dedicationFeatID: Int
//    @Persisted var feats: RealmSwift.List<SaveFeats>
    @Persisted var contentSrc: String
    @Persisted var tagID: Int
}
// Spell Data
class SpellData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var savingThrow: String?
    @Persisted var contentSrc: String
    @Persisted var range: String?
    @Persisted var targets: String?
    @Persisted var cast: String?
    @Persisted var trigger: String?
    @Persisted var level: Int
    @Persisted var requirements: String?
    @Persisted var cost: String?
    @Persisted var traditions: RealmSwift.List<String>
    @Persisted var rarity: String
    @Persisted var castingComponents: RealmSwift.List<String>
    @Persisted var isFocusSpell: Bool
    @Persisted var area: String?
    @Persisted var duration: String?
    @Persisted var heightenedOneVal: String?
    @Persisted var heightenedOneText: String?
    @Persisted var heightenedTwoVal: String?
    @Persisted var heightenedTwoText: String?
    @Persisted var heightenedThreeVal: String?
    @Persisted var heightenedThreeText: String?
    @Persisted var heightenedFourVal: String?
    @Persisted var heightenedFourText: String?
    @Persisted var traitIDs: RealmSwift.List<Int>

}
// Item Data
class ItemData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var traits: RealmSwift.List<Int>
    @Persisted var bulk: Float?
    @Persisted var level: Int
    @Persisted var brokenThreshold: Int?
    @Persisted var contentSrc: String
    @Persisted var usage: String? = nil
    @Persisted var hands: String? = nil
    @Persisted var itemStructType: String
    @Persisted var hasQuantity: Int
    @Persisted var rarity: String
    @Persisted var itemType: String
    @Persisted var price: Int?
    @Persisted var size: String
    @Persisted var hardness: Int? = nil
    @Persisted var materialType: String? = nil
    @Persisted var hitPoints: Int?
    @Persisted var addItemIDs: RealmSwift.List<Int>
    @Persisted var weapon: Weapon? = nil
    @Persisted var rune: Rune? = nil
    @Persisted var shield: Shield? = nil
    @Persisted var armor: Armor? = nil
    @Persisted var effects: Coding? = nil
}

class Weapon: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var diceNum: Int
    @Persisted var meleeWeaponType: String?
    @Persisted var rangedWeaponType: String?
    @Persisted var damageType: String
    @Persisted var dieType: String
    @Persisted var isMelee: Bool
    @Persisted var isRanged: Bool
    @Persisted var category: String
    @Persisted var profName: String
    @Persisted var rangedReload: Int
    @Persisted var range: Int
}
class Rune: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var etchedType: String
    @Persisted var isFundamental: Bool
}

class Shield: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var speedPenalty: Int
    @Persisted var profName: String
    @Persisted var acBonus: Int
}
class Armor: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var profName: String
    @Persisted var dexCap: Int?
    @Persisted var checkPenalty: Int
    @Persisted var category: String
    @Persisted var speedPenalty: Int
    @Persisted var minStrength: Int
    @Persisted var armorType: String
    @Persisted var acBonus: Int
}
// Versatile Heritage
class VersatileHeritageData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var rarity: String
    @Persisted var effects: Coding? = nil
}
// Ancestry Data
class AncestryData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var physcialFeatureID: RealmSwift.List<Int>
    @Persisted var visionSenseID: Int
    @Persisted var hitPoints: Int
    @Persisted var size: String
    @Persisted var tagID: Int
    @Persisted var speed: Int
    @Persisted var rarity: String
    @Persisted var flaws: String? = nil
    @Persisted var boosts: RealmSwift.List<String>
    @Persisted var heritageIDs: RealmSwift.List<Int>
    @Persisted var physicalFeature: RealmSwift.List<PhysicalFeature>
    @Persisted var additionalSense: AncestryAdditionalSense? = nil
    @Persisted var languages: RealmSwift.List<Language>
    @Persisted var bonusLanguages: RealmSwift.List<Language>
    @Persisted var visionSense: AncestryVisionSense? = nil
    @Persisted var effects: Coding? = nil
    @Persisted var heritages: RealmSwift.List<Heritage>
}
class PhysicalFeature: Object, Identifiable {
    @Persisted var itemWeaponID: Int?
    @Persisted var descriptions: String
    @Persisted var name: String
    @Persisted var id: Int
    @Persisted var overrides: String?
    @Persisted var effects: Coding?
}
class AncestryAdditionalSense: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
}
class Language: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var speakers: String
    @Persisted var descriptions: String?
}
class AncestryVisionSense: Object, Identifiable {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
}
class Heritage: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var ancestryID: Int? = nil
    @Persisted var ancestryName: String? = nil
    @Persisted var effects: Coding? = nil
}
// Background Data
class BackgroundData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var boosts: RealmSwift.List<Boosts>
    @Persisted var rarity: String
    @Persisted var effects: Coding? = nil
}
class Boosts: Object, Identifiable {
    @Persisted var abilityBoosts: RealmSwift.List<String>
}
// Class Data
class ClassData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var classProfs: RealmSwift.List<Proficiency>
    @Persisted var rarity: String
    @Persisted var tagID: Int
    @Persisted var hitPoints: Int
    @Persisted var keyAbility: RealmSwift.List<String>
    @Persisted var classAbility: RealmSwift.List<ClassAbility>
    @Persisted var additionalTrainedSkills: Int
    @Persisted var effects: Coding? = nil
}
class ClassAbility: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var level: Int? = nil
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
    @Persisted var classID: Int? = nil
    @Persisted var selectType: String? = nil
    @Persisted var classAbilityName: String? = nil
    @Persisted var className: String? = nil
    @Persisted var selectOptionFor: Int? = nil
    @Persisted var effects: Coding? = nil
}
// Deity
class DeityData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
    @Persisted var alignment: String
    @Persisted var nickname: String? = nil
    @Persisted var category: String
    @Persisted var edicts: String
    @Persisted var anathema: String
    @Persisted var areasOfConcern: RealmSwift.List<String>
    @Persisted var followerAlignments: RealmSwift.List<String>
    @Persisted var divineAbility: RealmSwift.List<String>
    @Persisted var divineFont: RealmSwift.List<String>
    @Persisted var divineSkill: String
    @Persisted var favoredWeapon: RealmSwift.List<String>
    @Persisted var domains: RealmSwift.List<String>
    @Persisted var alternateDomains: RealmSwift.List<String>
    @Persisted var clericSpells: RealmSwift.List<ClericSpells>
    @Persisted var minorBoon: String
    @Persisted var moderateBoon: String
    @Persisted var majorBoon: String
    @Persisted var minorCurse: String
    @Persisted var moderateCurse: String
    @Persisted var majorCurse: String
}
class ClericSpells: Object, Identifiable {
    @Persisted var level: Int
    @Persisted var name: String
}
// DOMAIN
class DomainData: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var deities: RealmSwift.List<String>
    @Persisted var domainSpell: String
    @Persisted var advancedDomainSpell: String
    @Persisted var apocryphalDomainSpell: String? = nil
    @Persisted var advancedApocryphalDomainSpell: String? = nil
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
}
