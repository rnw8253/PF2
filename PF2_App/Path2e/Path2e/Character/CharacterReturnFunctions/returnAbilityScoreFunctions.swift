//
//  returnAbilityScoreFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/3/23.
//

import Foundation

extension Character {
    
    func returnAbilityScoreMod(ability: String, excludeRoute: [Route]?) -> Int {
        let val = (Float(returnAbilityScore(ability: ability, excludeRoute: excludeRoute))-10.0)/2.0
        return Int(val.rounded(.towardZero))
    }
    func returnAbilityScore(ability: String, excludeRoute: [Route]?) -> Int {
        var score = returnBaseAbilityScore(ability: ability, excludeRoute: excludeRoute)
        score += returnAbilityCustomValue(ability: ability)
        score += returnAbilityBoostScore(ability: ability, excludeRoute: excludeRoute)
        score += returnApexAbilityScore(ability: ability, excludeRoute: excludeRoute)
        score += returnConditionAbilityScore(ability: ability)
        return score
    }
    func returnBaseAbilityScore(ability: String, excludeRoute: [Route]?) -> Int {
        var excludeType: ContainerType = .none
        if excludeRoute != nil {
            (_, excludeType, _) = returnChosenContainer(route: excludeRoute!)
        }
        var score = 10
        if excludeType != .currentClass {
            score += returnClassAbilityScore(ability: ability)
        }
        if excludeType != .ancestry {
            score += returnAncestryAbilityScore(ability: ability)
        }
        if excludeType != .background {
            score += returnBackgrounAbilityScore(ability: ability)
        }
        return score
    }
    func returnAbilityBoostScore(ability: String, excludeRoute: [Route]?) -> Int {
        let count = returnAbilityBoostCount(ability: ability, excludeRoute: excludeRoute)
        var score = returnBaseAbilityScore(ability: ability, excludeRoute: excludeRoute)
        var boostScore = 0
        if count > 0 {
            for _ in 0...count-1 {
                if score < 18 {
                    boostScore += 2
                    score += 2
                } else {
                    boostScore += 1
                    score += 1
                }
            }
        }
        return boostScore
    }
    func returnAbilityBoostCount(ability: String, excludeRoute: [Route]?) -> Int {
        var count = 0
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            if effect.abilityBoost.contains(ability) {
                count += 1
            }
        }
        return count
    }
    func returnAncestryAbilityScore(ability: String) -> Int {
        if ancestry != nil {
            if ancestry!.boosts.contains(ability) {
                return 2
            }
            if ancestry!.flaws == ability {
                return -2
            }
        }
        return 0
    }
    func returnClassAbilityScore(ability: String) -> Int {
        if currentClass != nil {
            if ability == currentClass!.keyAbility {
                return 2
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.keyAbility != nil {
                if effect.keyAbility == ability {
                    return 2
                }
            }
        }
        return 0
    }
    func returnBackgrounAbilityScore(ability: String) -> Int {
        if background != nil {
            if background!.boosts.contains(ability) {
                return 2
            }
        }
        return 0
    }
    func returnApexAbilityScore(ability: String, excludeRoute: [Route]?) -> Int {
        var score = returnBaseAbilityScore(ability: ability, excludeRoute: excludeRoute)
        score += returnAbilityBoostScore(ability: ability, excludeRoute: excludeRoute)
        if checkForApex(ability: ability) {
            return max(18-score,2)
        } else {
            return 0
        }
    }
    func checkForApex(ability: String) -> Bool {
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.giveApexAbilityScore.contains(ability) {
                return true
            }
        }
        return false
    }
    func returnConditionAbilityScore(ability: String) -> Int {
        var score = 0
        for condition in conditions {
            if condition.isActive == true {
                for mod in condition.modifications {
                    if mod.category == "Ability Score" {
                        if ability == mod.name! {
                            if mod.valueTimesTwo {
                                if mod.isPenalty {
                                    score -= condition.currentValue
                                } else {
                                    score += condition.currentValue
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return score
    }
    func returnAbilityCustomValue(ability: String) -> Int {
        switch ability {
        case "Strength":
            return strCustomScore
        case "Dexterity":
            return dexCustomScore
        case "Constitution":
            return conCustomScore
        case "Intelligence":
            return intCustomScore
        case "Charisma":
            return chaCustomScore
        case "Wisdom":
            return wisCustomScore
        default:
            return 0
        }
    }
    func returnKeyAbility() -> String {
        if currentClass != nil {
            if currentClass!.keyAbility != nil {
                if currentClass!.keyAbility != "Other" {
                    return currentClass!.keyAbility!
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            if effect.keyAbility != nil {
                return effect.keyAbility!
            }
        }
        return "Other"
    }
}
