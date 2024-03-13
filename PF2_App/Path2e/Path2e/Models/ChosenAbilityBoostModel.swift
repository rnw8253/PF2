//
//  ChosenAbilityBoostModel.swift
//  Path2e
//
//  Created by Ryan Weber on 11/19/23.
//

import Foundation
import SwiftUI
import RealmSwift

class ChosenAbilityBoostModel: ObservableObject, Hashable {
    @Published var abilityBoosts: [String] = []
    static func == (lhs: ChosenAbilityBoostModel, rhs: ChosenAbilityBoostModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(abilityBoosts)
    }

    func returnAbilityBoosts() ->  String {
        var selection = ""
        if abilityBoosts.count > 0 {
            for i in 0...abilityBoosts.count-1 {
                if i == 0 {
                    selection = String(abilityBoosts[i].capitalized.prefix(3))
                } else {
                    selection += ", \(abilityBoosts[i].capitalized.prefix(3))"
                }
            }
        }
        if selection == "" {
            return "Unselected"
        } else {
            return selection
        }
    }
}
