//
//  returnSavingThrowFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation

import Foundation

extension Character {
    
    func returnSavingThrowTotal(save: String, excludeRoute: [Route]?) -> Int {
        return returnSavingThrowProfValue(save: save, excludeRoute: excludeRoute) + returnSavingThrowModValue(save: save, excludeRoute: excludeRoute) + returnSavingThrowModifications(save: save, excludeRoute: excludeRoute) + returnSavingThrowCustomValue(save: save)
    }
    func returnSavingThrowProf(save: String, excludeRoute: [Route]?) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Save" {
                    if save == prof.name {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for prof in effect.otherProficiency {
                if prof.type == "Save" {
                    if save == prof.name {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnSavingThrowProfValue(save: String, excludeRoute: [Route]?) -> Int {
        return calcProficiency(returnSavingThrowProf(save: save, excludeRoute: excludeRoute), level, false)
    }
    func returnSavingThrowModType(save: String) -> String {
        switch save {
        case "Reflex":
            return "Dexterity"
        case "Fortitude":
            return "Constitution"
        case "Will":
            return "Wisdom"
        default:
            let _ = print("Error: Unknown Save: \(save)")
            return ""
        }
    }
    func returnSavingThrowModValue(save: String, excludeRoute: [Route]?) -> Int {
        return returnAbilityScoreMod(ability: returnSavingThrowModType(save: save), excludeRoute: excludeRoute)
    }
    func returnSavingThrowCustomValue(save: String) -> Int {
        switch save {
        case "Reflex":
            return reflexCustomSavingThrow
        case "Fortitude":
            return fortitudeCustomSavingThrow
        case "Will":
            return willCustomSavingThrow
        default:
            let _ = print("Error: Unknown Save: \(save)")
            return 0
        }
    }
    func returnSavingThrowModifications(save: String, excludeRoute: [Route]?) -> Int {
        var value = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if mod.category == "Save" {
                    if mod.name == save {
                        if mod.value != nil {
                            value += mod.value!
                        }
                    }
                }
            }
        }
        return value
    }
    func returnSavingThrowTempModifications(save: String, excludeRoute: [Route]?) -> [CharacterTemporaryModification] {
        var tempMod: [CharacterTemporaryModification] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryModification {
                if mod.category == "Save" {
                    if mod.name == save {
                        tempMod.append(mod)
                    }
                }
            }
        }
        return tempMod
    }
    func returnSavingThrowTempEffects(save: String, excludeRoute: [Route]?) -> [CharacterTemporaryEffects] {
        var tempMod: [CharacterTemporaryEffects] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryEffect{
                if mod.category == "Save" {
                    if mod.name == save {
                        tempMod.append(mod)
                    }
                }
            }
        }
        return tempMod
    }
}
