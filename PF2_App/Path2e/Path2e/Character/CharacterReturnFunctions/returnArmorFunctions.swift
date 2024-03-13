//
//  returnArmorFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 10/25/23.
//

import Foundation

extension Character {
    func returnAC(excludeRoute: [Route]?) -> Int {
        var modifier: Int = 10
        modifier += returnArmorProfValue(excludeRoute: excludeRoute)
        modifier += returnArmorBonus()
        modifier += returnACModifications(excludeRoute: excludeRoute)
        modifier += returnArmorDexValue()
        modifier += customACScore
        return modifier
    }
    func returnArmorCategory() -> String {
        return getEquippedArmor()?.category ?? "Unarmored"
    }
    func returnArmorProf(excludeRoute: [Route]?) -> String {
        let category = returnArmorCategory()
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Armor Category" {
                    if prof.name! == category {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for prof in effect.armorProficiencies {
                if prof.type == "Armor Category" {
                    if prof.name! == category {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnArmorProfValue(excludeRoute: [Route]?) -> Int {
        return calcProficiency(returnArmorProf(excludeRoute: nil), level, false)
    }
    func returnArmorBonus() -> Int {
        let armor = getEquippedArmor()
        if armor != nil {
            return armor!.acBonus
        } else {
            return 0
        }
    }
    func returnArmorDexCap() -> Int? {
        let armor = getEquippedArmor()
        if armor == nil {
            return nil
        } else {
            if armor!.dexCap != nil {
                return armor!.dexCap! + returnDexCapModification(excludeRoute: nil)
            } else {
                return nil
            }
        }
    }
    func returnDexCapModification(excludeRoute: [Route]?) -> Int {
        var value = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if mod.category == "Dex Cap" {
                    if mod.value != nil {
                        value += mod.value!
                    }
                }
            }
        }
        return value
    }
    func returnArmorDexValue() -> Int {
        let armor = getEquippedArmor()
        return min(returnAbilityScoreMod(ability: "Dexterity", excludeRoute: nil), armor?.dexCap ?? 1000)
    }
    func returnACModifications(excludeRoute: [Route]?) -> Int {
        var value = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if mod.category == "AC" {
                    if mod.value != nil {
                        value += mod.value!
                    }
                }
            }
        }
        return value
    }
    func returnACTempModifications(excludeRoute: [Route]?) -> [CharacterTemporaryModification] {
        var tempMod: [CharacterTemporaryModification] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryModification {
                if mod.category == "AC" {
                    tempMod.append(mod)
                }
            }
        }
        return tempMod
    }
    func returnArmorCategoryProf(category: String) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Armor Category" {
                    if prof.name! == category {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for prof in effect.armorProficiencies {
                if prof.type == "Armor Category" {
                    if prof.name! == category {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    
    func getEquippedArmor() -> Armor? {
        return nil
    }
    func isUnarmored() -> Bool {
        return false
    }
}
//@Persisted var setUnburdenedIron: Bool = false
//@Persisted var setMightyBulwark: Bool = false
//@Persisted var setArmorStealth: Bool = false
//@Persisted var giveArmorSpecialization: RealmSwift.List<CharacterArmorSpecialization>
//@Persisted var overrideArmorCheckPenalty: Int? = nil
//@Persisted var overrideArmorSpeedPenalty: Int? = nil
