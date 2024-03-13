//
//  returnClassAbilityFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 10/5/23.
//

import Foundation

extension Character {
    func checkClassAbility(classAbility: ClassAbility) -> Bool {
        var check = false
        if currentClass == nil {
            return false
        } else {
            for cAbility in classAbilities {
                if cAbility.name == classAbility.name && cAbility.level == classAbility.level {
                    if cAbility.id != nil  {
                        check = true
                    }
                }
            }
            return check
        }
    }
    
    func checkForAncestryFeats(levelGained: Int) -> CharacterFeat? {
        for feat in ancestryFeats {
            if feat.levelGained == levelGained {
                return feat
            }
        }
        return nil
    }
    
    func returnInitialSkills() -> String? {
        if initialTrainedSkills.count == 0 {
            return nil
        } else {
            var skillStr = ""
            for index in initialTrainedSkills.indices {
                if index == 0 {
                    skillStr = initialTrainedSkills[index].name!
                } else {
                    skillStr += ", \(initialTrainedSkills[index].name!)"
                }
            }
            return skillStr
        }
    }
}
