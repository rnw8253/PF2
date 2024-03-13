//
//  SkillClasses.swift
//  Path2e
//
//  Created by Ryan Weber on 11/15/23.
//

import Foundation
import RealmSwift

struct SkillProfTracker: Identifiable, Hashable {
    var id = UUID()
    var skill: String = ""
    var currentProfInt: Int = 0
    var canAlter: Bool = true
    var character: Character?
    var initProf: String = ""
    var initProfInt: Int = 0
    var initiated: Bool = false
    var excludeRoute: [Route]? = nil
    init(name: String, canAlter: Bool, character: Character, excludeRoute: [Route]?) {
        skill = name
        self.character = character
        self.canAlter = canAlter
        initProf = character.returnSkillProficiency(skill: skill, excludeRoute: excludeRoute)
        initProfInt = convertProfToInt(prof: initProf)
        currentProfInt = initProfInt
        initiated = true
        self.excludeRoute = excludeRoute
    }
    var skillProfModtype: String {
        returnSkillModType(skill: skill)
    }
    var skillModValue: Int {
        return character?.returnSkillModValue(skill: skill, excludeRoute: excludeRoute) ?? 0
    }
    var totalModValue: Int {
        return skillModValue + currentSkillProfValue
    }
    var currentSkillProfValue: Int {
        return calcProficiency(currentSkillProf, character?.level ?? 1, character?.returnSkillUseLevelForUntrained() ?? false)
    }
    var currentSkillProf: String {
        return convertIntToProf(value: currentProfInt)
    }
}

class SkillsTracker: ObservableObject {
    @Published var skills: [SkillProfTracker] = []
    func initiate(character: Character, selectableSkills: [String]?, excludeRoute: [Route]?) {
        if selectableSkills != nil {
            for skill in returnSkillList() {
                if selectableSkills!.contains(skill) {
                    skills.append(SkillProfTracker(name: skill, canAlter: true, character: character, excludeRoute: excludeRoute))
                } else {
                    skills.append(SkillProfTracker(name: skill, canAlter: false, character: character, excludeRoute: excludeRoute))
                }
            }
            if character.returnLores(excludeRoute: excludeRoute) != nil {
                for skill in character.returnLores(excludeRoute: excludeRoute)! {
                    skills.append(SkillProfTracker(name: skill, canAlter: false, character: character, excludeRoute: excludeRoute))
                }
            }
        } else {
            for skill in returnSkillList() {
                skills.append(SkillProfTracker(name: skill, canAlter: true, character: character, excludeRoute: excludeRoute))
            }
            if character.returnLores(excludeRoute: excludeRoute) != nil {
                for skill in character.returnLores(excludeRoute: excludeRoute)! {
                    skills.append(SkillProfTracker(name: skill, canAlter: true, character: character, excludeRoute: excludeRoute))
                }
            }
        }
    }
}
