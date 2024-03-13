//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenAncestryModel: ObservableObject, Hashable {
    @Published var ancestry: AncestryData? = nil
    @Published var ancestryFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    @Published var abilityBoost = ChosenAbilityBoostModel()
    @Published var physicalFeatures: [ChosenPhysicalFeatureModel?] = [nil,nil]
    static func == (lhs: ChosenAncestryModel, rhs: ChosenAncestryModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ancestryFeatures)
        hasher.combine(ancestry)
        hasher.combine(abilityBoost)
        hasher.combine(physicalFeatures)
    }
    
    func returnCharacterAncestry(levelGained: Int) -> CharacterAncestry {
        let newAncestry = CharacterAncestry()
        newAncestry.id = ancestry!.id
        newAncestry.name = ancestry!.name
        newAncestry.descriptions = ancestry!.descriptions
        newAncestry.visionSenseID = ancestry!.visionSenseID
        newAncestry.hitPoints = ancestry!.hitPoints
        newAncestry.size = ancestry!.size
        newAncestry.traitID = ancestry!.tagID
        newAncestry.speed = ancestry!.speed
        newAncestry.rarity = ancestry!.rarity
        newAncestry.flaws = ancestry!.flaws
        for boost in ancestry!.boosts {
            if boost != "Anything" {
                newAncestry.boosts.append(boost)
            }
        }
        for boost in abilityBoost.abilityBoosts {
            newAncestry.boosts.append(boost)
        }
        newAncestry.heritageIDs = ancestry!.heritageIDs
        newAncestry.additionalSenseID = ancestry!.additionalSense?.id ?? nil
        for lang in ancestry!.languages {
            newAncestry.languages.append(lang.name)
        }
        for lang in ancestry!.bonusLanguages {
            newAncestry.bonusLanguages.append(lang.name)
        }
        for heritage in ancestry!.heritages {
            newAncestry.heritageIDs.append(heritage.id)
        }
        if ancestry!.effects != nil {
            newAncestry.effects = ancestryFeatures.returnCharacterEffect(levelGained: levelGained, effects: ancestry!.effects!, containerKey: newAncestry.key)
        }
        for pf in physicalFeatures {
            if pf != nil {
                newAncestry.physicalFeatures.append(pf!.returnCharacterPhysicalFeature(levelGained: 1))
            }
        }
        newAncestry.levelGained = levelGained
        return newAncestry
    }
    
}
