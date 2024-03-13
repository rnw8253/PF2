//
//  returnPerceptionFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation

extension Character {
    func returnPerceptionModifier(excludeRoute: [Route]?) -> Int {
        var modifier: Int = 0
        modifier += returnAbilityScoreMod(ability: "Wisdom", excludeRoute: excludeRoute)
        modifier += returnPerceptionProfValue(excludeRoute: excludeRoute)
        modifier += returnPerceptionBonusValue(excludeRoute: excludeRoute)
        modifier += customPerceptionScore
        return modifier
    }
    func returnPerceptionProf(excludeRoute: [Route]?) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Perception" {
                    if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                        profInt = convertProfToInt(prof: convertProf(prof.prof))
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for prof in effect.otherProficiency {
                if prof.type == "Perception" {
                    if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                        profInt = convertProfToInt(prof: convertProf(prof.prof))
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnPerceptionProfValue(excludeRoute: [Route]?) -> Int {
        return calcProficiency(returnPerceptionProf(excludeRoute: excludeRoute), level, false)
    }
    func returnPerceptionBonusValue(excludeRoute: [Route]?) -> Int {
        var value: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.modification {
                if mod.category == "Perception" {
                    value += mod.value!
                }
            }
        }
        return value
    }
    func returnPerceptionTempModifications(excludeRoute: [Route]?) -> [CharacterTemporaryModification] {
        var tempMod: [CharacterTemporaryModification] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryModification {
                if mod.category == "Perception" {
                    tempMod.append(mod)
                }
            }
        }
        return tempMod
    }
}
