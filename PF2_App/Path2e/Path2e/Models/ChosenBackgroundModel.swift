//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenBackgroundModel: ObservableObject, Hashable {
    
    static func == (lhs: ChosenBackgroundModel, rhs: ChosenBackgroundModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    @Published var background: BackgroundData? = nil
    @Published var backgroundFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    @Published var abilityBoost = ChosenAbilityBoostModel()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(backgroundFeatures)
        hasher.combine(background)
        hasher.combine(abilityBoost)
    }
    
    func returnCharacterBackground(levelGained: Int) -> CharacterBackground {
        let newBackground = CharacterBackground()
        newBackground.id = background!.id
        newBackground.name = background!.name
        newBackground.descriptions = background!.descriptions
        newBackground.rarity = background!.rarity
        for boost in abilityBoost.abilityBoosts {
            newBackground.boosts.append(boost)
        }
        if background!.effects != nil {
            newBackground.effects = backgroundFeatures.returnCharacterEffect(levelGained: levelGained, effects: background!.effects!, containerKey: newBackground.key)
        }
        newBackground.levelGained = levelGained
        return newBackground
    }
}
