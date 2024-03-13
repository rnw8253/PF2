//
//  returnSkillFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/3/23.
//

import Foundation

extension Character {
    func returnLores(excludeRoute: [Route]?) -> [String]? {
        var lores: [String] = []
        let skills = returnSkillList()
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for skillProf in effect.skills {
                if !skills.contains(skillProf.skill) {
                    lores.append(skillProf.skill)
                }
            }
        }
        if lores == [] {
            return nil
        } else {
            return lores
        }
    }
    func returnSkillProficiency(skill: String, excludeRoute: [Route]?) -> String {
        var prof = "Untrained"
        if currentClass != nil {
            for profs in currentClass!.classProfs {
                if profs.type == "Skill" {
                    if profs.name == skill {
                        prof = compareProf(prof, profs.prof)
                    }
                }
            }
        }
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for skillProf in effect.skills {
                if skillProf.skill == skill {
                    prof = compareProf(prof, skillProf.prof)
                }
            }
        }
        return prof
    }
    func returnSkillProficiencyWithExcludingContainer(skill: String, excluding: String, excludeRoute: [Route]?) -> String {
        var prof = "Untrained"
        if currentClass != nil {
            for profs in currentClass!.classProfs {
                if profs.type == "Skill" {
                    if profs.name == skill {
                        prof = compareProf(prof, profs.prof)
                    }
                }
            }
        }
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for skillProf in effect.skills {
                if skillProf.skill == skill {
                    prof = compareProf(prof, skillProf.prof)
                }
            }
        }
        return prof
    }
    func returnSkillProfValue(skill: String, excludeRoute: [Route]?) -> Int {
        return calcProficiency(returnSkillProficiency(skill: skill, excludeRoute: excludeRoute), level, false)
    }
    func returnSkillModValue(skill: String, excludeRoute: [Route]?) -> Int {
        return returnAbilityScoreMod(ability: returnSkillModType(skill: skill), excludeRoute: excludeRoute)
    }
    func returnSkillTotalMod(skill: String, excludeRoute: [Route]?) -> Int {
        return returnSkillProfValue(skill: skill, excludeRoute: excludeRoute) + returnSkillModValue(skill: skill, excludeRoute: excludeRoute)
    }
    func returnSkillUseLevelForUntrained() -> Bool {
        return false
    }
    
}



