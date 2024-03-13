//
//  ChosenSpellModel.swift
//  Path2e
//
//  Created by Ryan Weber on 11/18/23.
//

import Foundation
import RealmSwift

class ChosenSpellModel: ObservableObject, Hashable {
    @Published var spell: SpellData? = nil
    
    static func == (lhs: ChosenSpellModel, rhs: ChosenSpellModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(spell)
    }
}
