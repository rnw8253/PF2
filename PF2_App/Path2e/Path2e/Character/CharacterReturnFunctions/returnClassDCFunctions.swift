//
//  returnClassDCFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation

extension Character {
    func returnClassDCModifier(excludeRoute: [Route]?) -> Int {
        var modifier: Int = 10
        modifier += returnAbilityScoreMod(ability: returnKeyAbility(), excludeRoute: excludeRoute)
        modifier += returnClassDCProfValue(excludeRoute: excludeRoute)
        modifier += customClassDCScore
        return modifier
    }
    func returnClassDCProf(excludeRoute: [Route]?) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Class DC" {
                    if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                        profInt = convertProfToInt(prof: convertProf(prof.prof))
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: excludeRoute) {
            for prof in effect.otherProficiency {
                if prof.type == "Class DC" {
                    if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                        profInt = convertProfToInt(prof: convertProf(prof.prof))
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnClassDCProfValue(excludeRoute: [Route]?) -> Int {
        return calcProficiency(returnClassDCProf(excludeRoute: excludeRoute), level, false)
    }
}
