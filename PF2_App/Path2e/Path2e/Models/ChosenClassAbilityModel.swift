//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenClassAbilityModel: ObservableObject, Hashable {
    static func == (lhs: ChosenClassAbilityModel, rhs: ChosenClassAbilityModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var classAbility: ClassAbility? = nil
    @Published var selectorAbility: ChosenClassAbilityModel? = nil
    @Published var classAbilityFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    func hash(into hasher: inout Hasher) {
        hasher.combine(classAbilityFeatures)
        hasher.combine(classAbility)
        hasher.combine(selectorAbility)
    }
    
    func returnCharacterClassAbility(levelGained: Int) -> CharacterClassAbility{
        let newClassAbility = CharacterClassAbility()
        newClassAbility.id = classAbility!.id
        newClassAbility.name = classAbility!.name
        newClassAbility.level = classAbility!.level
        newClassAbility.contentSrc = classAbility!.contentSrc
        newClassAbility.descriptions = classAbility!.descriptions
        newClassAbility.classID = classAbility!.classID
        newClassAbility.selectType = classAbility!.selectType
        newClassAbility.classAbilityName = classAbility!.classAbilityName
        newClassAbility.className = classAbility!.className
        newClassAbility.selectOptionFor = classAbility!.selectOptionFor
        if selectorAbility != nil {
            newClassAbility.selectorAbility = selectorAbility!.returnCharacterClassAbility(levelGained: levelGained)
        }
        if classAbility!.effects != nil {
            newClassAbility.effects = classAbilityFeatures.returnCharacterEffect(levelGained: levelGained, effects: classAbility!.effects!, containerKey: newClassAbility.key)
        }
        newClassAbility.levelGained = levelGained

        return newClassAbility
    }
}
