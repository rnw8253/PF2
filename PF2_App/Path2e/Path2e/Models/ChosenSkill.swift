//
//  ChosenSkill.swift
//  Path2e
//
//  Created by Ryan Weber on 10/5/23.
//

import Foundation
import RealmSwift

class ChosenSkill: ObservableObject, Hashable {
    static func == (lhs: ChosenSkill, rhs: ChosenSkill) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var name: [String] = []
    @Published var prof: [String] = []
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(prof)
    }
    func returnSelection() -> String {
        var selection = ""
        if name.count > 0 {
            for i in 0...name.count-1 {
                if i == 0 {
                    selection = name[i]
                } else {
                    selection += ", \(name[i])"
                }
            }
        }
        if selection == "" {
            return "Unselected"
        } else {
            return selection
        }
    }
    func clearData() {
        name = []
        prof = []
    }
    
    func returnCharacterInitialSkills() -> RealmSwift.List<CharacterProficiency> {
        let newList = RealmSwift.List<CharacterProficiency>()
        var newProf = CharacterProficiency()
        for index in name.indices {
            newProf = CharacterProficiency()
            newProf.name = name[index]
            newProf.prof = prof[index]
            newList.append(newProf)
        }
        return newList
    }
    func returnCharacterSkills() -> [CharacterSkill] {
        var skills: [CharacterSkill] = []
        var newSkill = CharacterSkill()
        for index in name.indices {
            newSkill = CharacterSkill()
            newSkill.skill = name[index]
            newSkill.prof = prof[index]
            skills.append(newSkill)
        }
        return skills
    }
}
