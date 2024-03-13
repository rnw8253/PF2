//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenVersatileHeritageModel: ObservableObject, Hashable {
    static func == (lhs: ChosenVersatileHeritageModel, rhs: ChosenVersatileHeritageModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var versatileHeritage: VersatileHeritageData? = nil
    @Published var versatileHeritageFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    func hash(into hasher: inout Hasher) {
        hasher.combine(versatileHeritage)
        hasher.combine(versatileHeritageFeatures)
    }
    
    func returnCharacterVersatileHeritage(levelGained: Int) -> CharacterVersatileHeritage {
        let newVH = CharacterVersatileHeritage()
        newVH.id = versatileHeritage!.id
        newVH.name = versatileHeritage!.name
        newVH.descriptions = versatileHeritage!.descriptions
        newVH.contentSrc = versatileHeritage!.contentSrc
        newVH.rarity = versatileHeritage!.rarity
        if versatileHeritage!.effects != nil {
            newVH.effects = versatileHeritageFeatures.returnCharacterEffect(levelGained: levelGained, effects: versatileHeritage!.effects!, containerKey: newVH.key)
        }
        newVH.levelGained = levelGained
       return newVH
    }
}
