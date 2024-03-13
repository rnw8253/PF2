//
//  returnTraitFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/4/23.
//

import Foundation



extension Character {
    func returnAncestryHeritageTraitIDs(excludeRoute: [Route]?) -> [Int] {
        let data = LoadDataModel()
        var traits: [Int] = []
        if ancestry != nil {
            traits.append(ancestry!.traitID!)
        }
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for trait in effect.traits {
                let t = data.traits.filter("name == %@", trait)[0]
                traits.append(t.id)
            }
        }
        return traits
    }
    func returnArchetypeTraitIDs() -> [Int] {
        let data = LoadDataModel()
        var traits: [Int] = [616]
//        for feat in feats {
//            if feat.traits.contains(580) {
//                for trait in feat.traits {
//                    let t = data.traits.filter("name == %@", trait)[0]
//                    let temp = t.name.split(separator: " ")
//                    if String(temp[-1]) == "Archetype" {
//                        traits.append(t.id)
//                    }
//                }
//            }
//        }
        return traits
    }
    func returnClassTraitIDs() -> [Int] {
        var traits: [Int] = []
        if currentClass != nil {
            traits.append(currentClass?.traitID ?? 525)
        }
        return traits
    }
}
