//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenHeritageModel: ObservableObject, Hashable {
    static func == (lhs: ChosenHeritageModel, rhs: ChosenHeritageModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var heritage: Heritage? = nil
    @Published var heritageFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    func hash(into hasher: inout Hasher) {
        hasher.combine(heritageFeatures)
        hasher.combine(heritage)
    }
     
    func returnCharacterHeritage(levelGained: Int) -> CharacterHeritage {
        let newHeritage = CharacterHeritage()
        newHeritage.id = heritage!.id
        newHeritage.name = heritage!.name
        newHeritage.descriptions = heritage!.descriptions
        newHeritage.contentSrc = heritage!.contentSrc
        newHeritage.ancestryID = heritage!.ancestryID
        newHeritage.ancestryName = heritage!.ancestryName
        if heritage!.effects != nil {
            newHeritage.effects = heritageFeatures.returnCharacterEffect(levelGained: levelGained, effects: heritage!.effects!, containerKey: newHeritage.key)
        }
        newHeritage.levelGained = levelGained
        return newHeritage
    }

}
