//
//  returnEffects.swift
//  Path2e
//
//  Created by Ryan Weber on 10/12/23.
//

import Foundation
import RealmSwift

extension Character {
    func getEffects(lvl: Int?, excludeRoute: [Route]?) -> RealmSwift.List<CharacterEffects> {
        var excludeType: ContainerType = .none
        if excludeRoute != nil {
            (_,excludeType,_) = returnChosenContainer(route: excludeRoute!)
        }
        let effects = RealmSwift.List<CharacterEffects>()
        if lvl == nil || lvl == 1 {
            if excludeType != .currentClass {
                if currentClass != nil {
                    if currentClass!.effects != nil {
                        effects.append(currentClass!.effects!)
                    }
                }
            }
            if excludeType != .ancestry {
                if ancestry != nil {
                    if ancestry!.effects != nil {
                        effects.append(ancestry!.effects!)
                    }
                    if ancestry!.physicalFeatures.count > 0 {
                        for pFeature in ancestry!.physicalFeatures {
                            if pFeature.effects != nil {
                                effects.append(pFeature.effects!)
                            }
                        }
                    }
                }
            }
            if excludeType != .heritage {
                if heritage != nil {
                    if heritage!.effects != nil {
                        effects.append(heritage!.effects!)
                    }
                }
            }
            if excludeType != .versatileHeritage {
                if versatileHeritage != nil {
                    if versatileHeritage!.effects != nil {
                        effects.append(versatileHeritage!.effects!)
                    }
                }
            }
            if excludeType != .background {
                if background != nil {
                    if background!.effects != nil {
                        effects.append(background!.effects!)
                    }
                }
            }
        }
        if lvl == nil {
            for cAbility in getAllClassAbilities(excludeRoute: excludeRoute) {
                if cAbility.effects != nil {
                    effects.append(cAbility.effects!)
                }
            }
            for feat in getAllFeats(excludeRoute: excludeRoute) {
                if feat.effects != nil {
                    effects.append(feat.effects!)
                }
            }
        } else {
            for cAbility in getAllClassAbilities(excludeRoute: excludeRoute) where cAbility.levelGained == lvl! {
                if cAbility.effects != nil {
                    effects.append(cAbility.effects!)
                }
            }
            for feat in getAllFeats(excludeRoute: excludeRoute) where feat.levelGained == lvl! {
                if feat.effects != nil {
                    effects.append(feat.effects!)
                }
            }
        }
        return effects
    }
}




