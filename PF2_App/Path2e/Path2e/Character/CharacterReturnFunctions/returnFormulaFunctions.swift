//
//  returnFormulaFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/20/23.
//

import Foundation

extension Character {
    func returnAlchemyProgression() -> Bool {
        let effects = getEffects(lvl: nil, excludeRoute: nil)
        for effect in effects {
            if effect.giveAlchemistProgression == true {
                return true
            }
        }
        return false
    }
    func updateResearchField(lvl: Int) {
        for cAbility in classAbilities.filter("levelGained == %@", lvl) {
            if cAbility.selectOptionFor == 9469 {
                formulaList!.researchField = cAbility.name
            }
        }
    }
    func returnFormulaIDs(excludeRoute: [Route]?) -> [Int] {
        var spellIDs: [Int] = []
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for id in effect.alchemicalFormulas {
                spellIDs.append(id)
            }
            for id in effect.fieldFormulas {
                spellIDs.append(id)
            }
        }
        return spellIDs
    }
}
