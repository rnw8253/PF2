//
//  returnCharacterObjectFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 10/19/23.
//

import Foundation
import RealmSwift

extension Character {
    func getAllClassAbilities(excludeRoute: [Route]?) -> RealmSwift.List<CharacterClassAbility> {
        var excludeName: String = ""
        var excludeType: ContainerType = .none
        var excludeLevel: Int = 0
        if excludeRoute != nil {
            (excludeName, excludeType, excludeLevel) = returnChosenContainer(route: excludeRoute!)
        }
        
        let cAbilities = RealmSwift.List<CharacterClassAbility>()
        for ability in classAbilities {
            if !(excludeType == .classAbility && ability.name == excludeName && ability.levelGained == excludeLevel) {
                if ability.id != nil {
                    cAbilities.append(ability)
                    if ability.selectorAbility != nil {
                        cAbilities.append(ability.selectorAbility!)
                    }
                }
            }
        }
        return cAbilities
    }
    func getAllFeats(excludeRoute: [Route]?) -> RealmSwift.List<CharacterFeat> {
        let feats = RealmSwift.List<CharacterFeat>()
        var excludeName: String = ""
        var excludeType: ContainerType = .none
        var excludeLevel: Int = 0
        if excludeRoute != nil {
            (excludeName, excludeType, excludeLevel) = returnChosenContainer(route: excludeRoute!)
        }
        for feat in ancestryFeats {
            if !(excludeType == .ancestryFeat && feat.name == excludeName && feat.levelGained == excludeLevel) {
                for f in getFeatsFromFeat(feat: feat) {
                    feats.append(f)
                }
            }
        }
        for cAbility in getAllClassAbilities(excludeRoute: excludeRoute) {
            for f in getFeatsFromClassAbilities(classAbility: cAbility) {
                feats.append(f)
            }
        }
        return feats
    }
    func getFeatsFromFeat(feat: CharacterFeat) -> RealmSwift.List<CharacterFeat> {
        let feats = RealmSwift.List<CharacterFeat>()
        feats.append(feat)
        if feat.effects != nil {
            if feat.effects!.feats.count > 0 {
                for fs in feat.effects!.feats {
                    for f in getFeatsFromFeat(feat: fs) {
                        feats.append(f)
                    }
                }
            }
        }
        return feats
    }
    func getFeatsFromClassAbilities(classAbility: CharacterClassAbility) -> RealmSwift.List<CharacterFeat> {
        let feats = RealmSwift.List<CharacterFeat>()
        if classAbility.effects != nil {
            if classAbility.effects!.feats.count > 0 {
                for fs in classAbility.effects!.feats {
                    for f in getFeatsFromFeat(feat: fs) {
                        feats.append(f)
                    }
                }
            }
        }
        return feats
    }
    func returnChosenContainer(route: [Route]) -> (String,ContainerType,Int) {
        let (currentName, type) = determineContainer(route: route)
        if type.count > 0 {
            switch type[0] {
            case .background:
                if background != nil {
                    return (background!.name, .background, 1)
                } else {
                    return ("",.none, 0)
                }
            case .currentClass:
                if currentClass != nil {
                    return (currentClass!.name, .currentClass, 1)
                } else {
                    return ("",.none, 0)
                }
            case .ancestry:
                if ancestry != nil {
                    return (ancestry!.name, .ancestry, 1)
                } else {
                    return ("",.none, 0)
                }
            case .heritage:
                if background != nil {
                    return (heritage!.name, .heritage, 1)
                } else {
                    return ("",.none, 0)
                }
            case .versatileHeritage:
                if versatileHeritage != nil {
                    return (versatileHeritage!.name, .versatileHeritage, 1)
                } else {
                    return ("",.none,0)
                }
            case .ancestryFeat:
                for feat in ancestryFeats {
                    if feat.levelGained == level {
                        return (feat.name, .ancestryFeat, level)
                    }
                }
                return ("",.none,0)
            case .classAbility:
                if type.last == .classAbility {
                    for cAbility in classAbilities {
                        if cAbility.name == currentName.last && cAbility.level == level {
                            return (cAbility.name, .classAbility, level)
                        }
                    }
                }
                return ("",.none,0)
            case .feat:
                if type.count > 1 {
                    if type.last == .classAbility {
                        for cAbility in classAbilities {
                            if cAbility.name == currentName.last && cAbility.level == level {
                                return (cAbility.name, .classAbility, level)
                            }
                        }
                    }
                }
                return ("",.none,0)
            default:
                return ("",.none,0)
            }
        } else {
            return("",.none,0)
        }
    }
}
