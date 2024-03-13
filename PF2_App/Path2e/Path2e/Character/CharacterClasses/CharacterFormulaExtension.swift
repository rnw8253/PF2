//
//  CharacterFormulaList.swift
//  Path2e
//
//  Created by Ryan Weber on 10/13/23.
//

import Foundation
import RealmSwift

class CharacterFormulaList: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var researchField: String
    @Persisted var perpetualInfusions: RealmSwift.List<CharacterListFormula>
    @Persisted var perpetualPotency: RealmSwift.List<CharacterListFormula>
    @Persisted var perpetualPerfection: RealmSwift.List<CharacterListFormula>
    @Persisted var formulas: RealmSwift.List<CharacterListFormula>
    convenience init(researchField: String) {
        self.init()
        self.researchField = researchField
        self.formulas = RealmSwift.List<CharacterListFormula>()
        self.perpetualPotency = RealmSwift.List<CharacterListFormula>()
        self.perpetualInfusions = RealmSwift.List<CharacterListFormula>()
        self.perpetualPerfection = RealmSwift.List<CharacterListFormula>()
        var newFormula = CharacterListFormula()
        for level in 1...20 {
            for _ in 0...1 {
                newFormula = CharacterListFormula()
                newFormula.id = 0
                newFormula.name = ""
                newFormula.levelGained = level
                formulas.append(newFormula)
            }
        }
        for _ in 0...1 {
            newFormula = CharacterListFormula()
            newFormula.id = 0
            newFormula.name = ""
            newFormula.levelGained = 7
            perpetualInfusions.append(newFormula)
        }
        for _ in 0...1 {
            newFormula = CharacterListFormula()
            newFormula.id = 0
            newFormula.name = ""
            newFormula.levelGained = 11
            perpetualPotency.append(newFormula)
        }
        for _ in 0...1 {
            newFormula = CharacterListFormula()
            newFormula.id = 0
            newFormula.name = ""
            newFormula.levelGained = 17
            perpetualPerfection.append(newFormula)
        }
    }
    
    func returnFormulaIDs() -> [Int] {
        var ids: [Int] = []
        for formula in formulas {
            if formula.id != 0 {
                ids.append(formula.id)
            }
        }
        return ids
    }
}

class CharacterListFormula: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var levelGained: Int
}

class CharacterFormula: Object, Identifiable {
    @Persisted var formulaID: Int
    @Persisted var formulaName: String
    @Persisted var levelGained: Int
}
