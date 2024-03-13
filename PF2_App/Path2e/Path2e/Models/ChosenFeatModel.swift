//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenFeatModel: ObservableObject, Hashable {
    static func == (lhs: ChosenFeatModel, rhs: ChosenFeatModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var feat: FeatData? = nil
    @Published var chosenFeatFeatures: ChosenFeaturesModel? = nil
    func hash(into hasher: inout Hasher) {
        hasher.combine(chosenFeatFeatures)
        hasher.combine(feat)
    }
    
    func returnCharacterFeat(levelGained: Int) -> CharacterFeat {
        let newFeat = CharacterFeat()
        newFeat.id = feat!.id
        newFeat.name = feat!.name
        newFeat.level = feat!.level
        newFeat.rarity = feat!.rarity
        newFeat.contentSrc = feat!.contentSrc
        newFeat.descriptions = feat!.descriptions
        newFeat.genTypeName = feat!.genTypeName
        newFeat.genericType = feat!.genericType
        newFeat.skillID = feat!.skillID
        newFeat.actions = feat!.actions
        newFeat.cost = feat!.cost
        newFeat.frequency = feat!.frequency
        newFeat.prerequisites = feat!.prerequisites
        newFeat.requirements = feat!.requirements
        newFeat.special = feat!.special
        newFeat.trigger = feat!.trigger
        for id in feat!.traits {
            newFeat.traits.append(id)
        }
        if feat!.effects != nil {
            newFeat.effects = chosenFeatFeatures!.returnCharacterEffect(levelGained: levelGained, effects: feat!.effects!, containerKey: newFeat.key)
        }
        newFeat.levelGained = levelGained
     
        return newFeat
    }
}
