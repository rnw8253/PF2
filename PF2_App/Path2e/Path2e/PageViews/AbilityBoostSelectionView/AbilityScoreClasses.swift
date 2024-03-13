//
//  File.swift
//  Path2e
//
//  Created by Ryan Weber on 11/19/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct AbilityScoreTracker: Identifiable, Hashable {
    var id = UUID()
    var ability: String
    var isPicked: Bool = false
    var character: Character
    var isFirstOption: Bool = false
    var isBoost: Bool = false
    var isFlaw: Bool = false
    var excudeRoute: [Route]?
    init(ability: String, options: Boosts?, boosts: [String]?, flaw: String?, character: Character, excludeRoute: [Route]?) {
        self.ability = ability
        if options != nil {
            for choice in options!.abilityBoosts {
                if ability == choice || choice == "All" {
                    self.isFirstOption = true
                }
            }
        }
        if boosts != nil {
            for choice in boosts! {
                if ability == choice {
                    self.isBoost = true
                }
            }
        }
        if flaw != nil {
            if ability == flaw! {
                self.isFlaw = true
            }
        }
        self.character = character
        self.excudeRoute = excludeRoute
    }
    
    var initAbilityScore: Int {
        return character.returnAbilityScore(ability: ability, excludeRoute: excudeRoute)
    }
    var currAbilityScore: Int {
        if isBoost {
            if initAbilityScore >= 18 {
                return initAbilityScore + 1
            } else {
                return initAbilityScore + 2
            }
        } else if isFlaw {
                return initAbilityScore - 2
        } else {
            if isPicked {
                if initAbilityScore >= 18 {
                    return initAbilityScore + 1
                } else {
                    return initAbilityScore + 2
                }
            } else {
                return initAbilityScore
            }
        }
    }
    var currAbilityMod: String {
        return signInt(determineMod(currAbilityScore))
    }
    var boost: String {
        if isBoost {
            if initAbilityScore >= 18 {
                return signInt(1)
            } else {
                return signInt(2)
            }
        } else if isFlaw {
            return(signInt(-2))
        }
        if isPicked {
            if initAbilityScore >= 18 {
                return signInt(1)
            } else {
                return signInt(2)
            }
        } else {
            return "0"
        }
    }
}

class AbilitiesTracker: ObservableObject {
    @Published var abilities: [AbilityScoreTracker] = []
    func initiate(options: Boosts?, boosts: [String]?, flaw: String?, character: Character, excludeRoute: [Route]?) {
        for ability in returnAbilityList() {
            abilities.append(AbilityScoreTracker(ability: ability, options: options, boosts: boosts, flaw: flaw, character: character, excludeRoute: excludeRoute))
        }
    }
}
