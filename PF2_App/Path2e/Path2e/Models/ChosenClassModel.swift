//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenClassModel: ObservableObject, Hashable {
    static func == (lhs: ChosenClassModel, rhs: ChosenClassModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    @Published var className: ClassData? = nil
    @Published var chosenFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    @Published var keyAbility: String = ""
    func hash(into hasher: inout Hasher) {
        hasher.combine(chosenFeatures)
        hasher.combine(className)
        hasher.combine(keyAbility)
    }
    
    func returnCharacterClass(levelGained: Int) -> CharacterClass {
        let newClass = CharacterClass()
        newClass.id = className!.id
        newClass.name = className!.name
        newClass.descriptions = className!.descriptions
        newClass.contentSrc = className!.contentSrc
        for prof in className!.classProfs {
            let newProf = CharacterProficiency()
            newProf.name = prof.name
            newProf.prof = prof.prof
            newProf.type = prof.type
            newClass.classProfs.append(newProf)
        }
        newClass.rarity = className!.rarity
        newClass.traitID = className!.tagID
        newClass.hitPoints = className!.hitPoints
        for ability in className!.classAbility {
            newClass.classAbilityIDs.append(ability.id)
        }
        newClass.additionalTrainedSkills = className!.additionalTrainedSkills
        if className!.keyAbility.count > 1 {
            if keyAbility != "" {
                newClass.keyAbility = keyAbility
            }
        } else {
            newClass.keyAbility = className!.keyAbility[0]
        }
        if className!.effects != nil {
            newClass.effects = chosenFeatures.returnCharacterEffect(levelGained: levelGained, effects: className!.effects!, containerKey: newClass.key)
        }
        newClass.levelGained = levelGained

        return newClass
    }
}
