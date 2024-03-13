//
//  returnSpeedFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/28/23.
//

import Foundation


extension Character {
    func returnSpeed(type: String) -> Int {
        var speed: Int = 0
        speed += returnBaseSpeed(type: type)
        speed += returnSpeedModification(type: type)
        speed += returnCustomSpeedValue(type: type)
        return speed
        
    }
    func returnBaseSpeed(type: String) -> Int {
        if type == "Speed" {
            return max(returnGiveSpeed(type: type), returnAncestryWalkSpeed())
        } else {
            return returnGiveSpeed(type: type)
        }
    }
    func returnAncestryWalkSpeed() -> Int {
        return ancestry?.speed ?? 0
    }
    func returnGiveSpeed(type: String) -> Int {
        var value: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for speed in effect.giveSpeed {
                if speed.type == type {
                    if speed.value != nil {
                        value = max(speed.value!, value)
                    } else if speed.landSpeed {
                        value = max(returnSpeed(type: "Speed"), value)
                    }
                }
            }
        }
        return value
    }
    func returnSpeedModification(type: String) -> Int {
        var speed: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for mod in effect.modification {
                if type == "Speed" {
                    if mod.category == "Speed" {
                        speed += mod.value!
                    }
                } else if type == "Swim" {
                    if mod.category == "Swim Speed" {
                        speed += mod.value!
                    }
                } else if type == "Fly" {
                    if mod.category == "Fly Speed" {
                        speed += mod.value!
                    }
                } else if type == "Panache" {
                    if mod.category == "Panache Speed" {
                        speed += mod.value!
                    }
                }
            }
        }
        return speed
    }
    func returnSpeedTempModifications(excludeRoute: [Route]?) -> [CharacterTemporaryModification] {
        var tempMod: [CharacterTemporaryModification] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryModification {
                if mod.category == "Speed" {
                    tempMod.append(mod)
                }
            }
        }
        return tempMod
    }
    func returnSpeedTempEffect(excludeRoute: [Route]?) -> [CharacterTemporaryEffects] {
        var tempMod: [CharacterTemporaryEffects] = []
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for mod in effect.temporaryEffect {
                if mod.category == "Speed" {
                    tempMod.append(mod)
                }
            }
        }
        return tempMod
    }
    func returnCustomSpeedValue(type: String) -> Int {
        switch type {
        case "Speed":
            return customSpeedScore
        case "Swim":
            return customSwimSpeedScore
        case "Climb":
            return customClimbSpeedScore
        case "Burrow":
            return customBurrowSpeedScore
        case "Fly":
            return customFlySpeedScore
        default:
            return 0
        }
    }
}


