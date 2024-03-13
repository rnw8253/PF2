//
//  LevelUpCharacterModel.swift
//  Path2e
//
//  Created by Ryan Weber on 8/1/23.
//

import Foundation
import RealmSwift
import SwiftUI

class LevelUpCharacterModel: ObservableObject, Hashable {
    static func == (lhs: LevelUpCharacterModel, rhs: LevelUpCharacterModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    let realm = try! Realm()
    @Published var classAbilities: [ChosenClassAbilityModel?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    @Published var ancestryFeat: ChosenFeatModel? = nil
    @Published var skills: ChosenSkill? = nil
    @Published var langauges: [String] = ["","","","",""]
    @Published var spellSlots: [ChosenSpellsModel] = [ChosenSpellsModel(),ChosenSpellsModel(),ChosenSpellsModel(), ChosenSpellsModel(),ChosenSpellsModel()]
    @Published var signatureSpell: [SpellData?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    @Published var switchSignatureSpell: [SpellData?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    @Published var alchemicalFormulas: [ChosenItemModel] = [ChosenItemModel(),ChosenItemModel(),ChosenItemModel(),ChosenItemModel(),ChosenItemModel()]
    func hash(into hasher: inout Hasher) {
        hasher.combine(classAbilities)
        hasher.combine(ancestryFeat)
        hasher.combine(skills)
        hasher.combine(langauges)
        hasher.combine(spellSlots)
        hasher.combine(signatureSpell)
    }
}
