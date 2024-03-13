//
//  ChosenPhysicalFeature.swift
//  Path2e
//
//  Created by Ryan Weber on 7/28/23.
//

import Foundation

class ChosenPhysicalFeatureModel: ObservableObject, Hashable {
    static func == (lhs: ChosenPhysicalFeatureModel, rhs: ChosenPhysicalFeatureModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var physicalFeature: PhysicalFeature? = nil
    @Published var physicalFeatureFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    func hash(into hasher: inout Hasher) {
        hasher.combine(physicalFeatureFeatures)
        hasher.combine(physicalFeature)
    }
    
    func returnCharacterPhysicalFeature(levelGained: Int) -> CharacterPhysicalFeature {
        let newPF = CharacterPhysicalFeature()
        newPF.id = physicalFeature!.id
        newPF.name = physicalFeature!.name
        newPF.overrides = physicalFeature!.overrides
        newPF.descriptions = physicalFeature!.descriptions
        newPF.weaponID = physicalFeature!.itemWeaponID
        if physicalFeature!.effects != nil {
            newPF.effects = physicalFeatureFeatures.returnCharacterEffect(levelGained: levelGained, effects: physicalFeature!.effects!, containerKey: newPF.key)
        }
        newPF.levelGained = levelGained
        return newPF
    }
}
