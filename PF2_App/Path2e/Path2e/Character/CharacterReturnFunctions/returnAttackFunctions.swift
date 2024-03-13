//
//  returnAttackFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 10/25/23.
//

import Foundation

extension Character {
//    func returnWeaponAttackModifier(weapon: Weapon) -> Int {
//    }
//    func returnWeaponDamage(weapon: Weapon) -> String
//    @Persisted var increaseDeificWeaponDamge: Bool = false
//    @Persisted var upgradeUnarmedAttackDice: Bool = false
//    }
//    func returnWeaponDamageModifier(weapon: Weapon) -> Int {
//    }
//    func returnWeaponProf(weapon: Weapon) -> String {
//    }
//        func returnWeaponProfValue(weapon: Weapon) -> Int {
//            @Persisted var addLevelToUntrainedWeapons = false
//        }
    func returnWeaponAttackModification(isMelee: Bool, excludeRoute: [Route]?) -> Int {
        var value: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if mod.category == "Attack" {
                    value += mod.value!
                }
                if isMelee {
                    if mod.category == "Melee Attacks" {
                        value += mod.value!
                    }
                }
            }
        }
        return value
    }
    func returnWeaponDamageModification(isMelee: Bool, excludeRoute: [Route]?) -> Int {
        var value: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if isMelee {
                    if mod.category == "Melee Attack Damage" {
                        value += mod.value!
                    }
                }
            }
        }
        return value
    }
    func returnAttackTempEffect(excludeRoute: [Route]?) -> [CharacterTemporaryEffects] {
        var tempMod: [CharacterTemporaryEffects] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryEffect {
                if mod.category == "Attack Damage" {
                    tempMod.append(mod)
                }
            }
        }
        return tempMod
    }
    func returnWeaponSpecialization(weaponProf: String) -> Int {
        switch weaponProf {
        case "Untrained":
            return 0
        case "Trained":
            return 0
        case "Expert":
            return 2
        case "Master":
            return 3
        case "Legendary":
            return 4
        default:
            return 0
        }
    }
    func returnGreaterWeaponSpecialization(weaponProf: String) -> Int {
        switch weaponProf {
        case "Untrained":
            return 0
        case "Trained":
            return 0
        case "Expert":
            return 4
        case "Master":
            return 6
        case "Legendary":
            return 8
        default:
            return 0
        }
    }
    func retrunHasWeaponSpecialization() -> Bool {
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.giveWeaponSpecialization {
                return true
            }
        }
        return false
    }
    func retrunHasGreaterWeaponSpecialization() -> Bool {
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.giveGreaterWeaponSpecialization {
                return true
            }
        }
        return false
    }

//func returnWeaponCriticalSpecialization() -> String {
//    @Persisted var giveWeaponCriticalSpecialization: RealmSwift.List<CharacterWeaponCriticalizationSpecialization>
//}
    func returnWeaponDamageAbilityMod(item: ItemData) -> String? {
        let isThrown = item.traits.contains(47)
        let isFinesse = item.traits.contains(42)
        let isMelee = item.weapon?.isMelee ?? false
        if isMelee || isThrown {
            if isFinesse {
                if returnDexAsDamageForFinesse() {
                    if returnAbilityScore(ability: "Dexterity", excludeRoute: nil) > returnAbilityScore(ability: "Strength", excludeRoute: nil) {
                        return "Dexterity"
                    } else {
                        return "Strength"
                    }
                } else {
                    return "Strength"
                }
            } else {
                return "Strength"
            }
        } else {
            return nil
        }
    }
    func returnDexAsDamageForFinesse() -> Bool {
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.setFinesseMeleeDamageAsDex {
                return true
            }
        }
        return false
    }
    func returnWeaponDamageAbilityModValue(item: ItemData) -> Int {
        return returnWeaponDamageAbilityMod(item: item) != nil ? calcProficiency(returnWeaponDamageAbilityMod(item: item)!, level, false) : 0
    }
    
    func returnWeaponAttackAbilityMod(item: ItemData) -> String {
        let isMelee = item.weapon?.isMelee ?? false
        let isFinesse = item.traits.contains(42)
        if isMelee {
            if isFinesse {
                if returnAbilityScore(ability: "Dexterity", excludeRoute: nil) > returnAbilityScore(ability: "Strength", excludeRoute: nil) {
                    return "Dexterity"
                } else {
                    return "Strength"
                }
            } else {
                return "Strength"
            }
        } else {
            return "Dexterity"
        }
    }
    func returnWeaponAttackAbilityModValue(item: ItemData) -> Int {
        return calcProficiency(returnWeaponAttackAbilityMod(item: item), level, false)
    }
    func returnImprovisedWeaponNoPenalty() -> Bool {
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.improvisedWeaponNoPenalty {
                return true
            }
        }
        return false
    }
    func returnMAP(item: ItemData) -> Int {
        var map = -5
        if item.traits.contains(43) {
            map = -4
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.setTier2Agile {
                map = -3
            }
        }
        return map
    }

    func returnWeaponRuneAttackBonus() -> Int {
        
    }
    func returnWeaponRuneDamageBonus() -> Int {
        
    }
    func returnWeaponRuneDamage() -> String {
        
    }


    func weaponFamiliarityProf(itemTraits: [Int]) -> String {
        @Persisted var giveWeaponFamiliarity: RealmSwift.List<String>
    }
}


  


}


//@Persisted var onHitDamage: String? = nil
//@Persisted var onHitOther: String? = nil
//@Persisted var onHitConditional: String? = nil
//@Persisted var onCritOther: String? = nil
//@Persisted var onCritConditional: String? = nil
