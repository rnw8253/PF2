//
//  ChosenSpellsModel.swift
//  Path2e
//
//  Created by Ryan Weber on 8/10/23.
//

import Foundation

class ChosenSpellsModel: ObservableObject, Hashable {
    static func == (lhs: ChosenSpellsModel, rhs: ChosenSpellsModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var spells: [[SpellData?]] = [[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]]
    func hash(into hasher: inout Hasher) {
        hasher.combine(spells)
    }
    
    func spontaneousChosenSpellIDs(spellLevel: Int) -> [Int] {
        var spellIDs: [Int] = []
        for spell in spells[spellLevel] {
            if spell != nil {
                spellIDs.append(spell!.id)
            }
        }
        return spellIDs
    }
    
    func preparedChosenSpellIDs() -> [Int] {
        var spellIDs: [Int] = []
        for spellLevel in 0...10 {
            for spell in spells[spellLevel] {
                if spell != nil {
                    spellIDs.append(spell!.id)
                }
            }
        }
        return spellIDs
    }
}
