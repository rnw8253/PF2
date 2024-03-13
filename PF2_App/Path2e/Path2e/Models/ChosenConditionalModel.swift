//
//  ChosenConditionalModel.swift
//  Path2e
//
//  Created by Ryan Weber on 11/15/23.
//

import Foundation
import RealmSwift
import SwiftUI

class ChosenConditionalModel: ObservableObject, Hashable {
    static func == (lhs: ChosenConditionalModel, rhs: ChosenConditionalModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    let realm = try! Realm()
    @Published var skill = ChosenSkill()
    @Published var language: [String] = ["","","","",""]
    @Published var lore: [String] = ["","","","",""]
    @Published var spell = ChosenSpellModel()
    @Published var feat = ChosenFeatModel()
    @Published var elseFeat = ChosenFeatModel()
    @Published var elseSkill = ChosenSkill()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(skill)
        hasher.combine(language)
        hasher.combine(lore)
        hasher.combine(spell)
        hasher.combine(feat)
        hasher.combine(elseSkill)
        hasher.combine(elseFeat)
    }
}
