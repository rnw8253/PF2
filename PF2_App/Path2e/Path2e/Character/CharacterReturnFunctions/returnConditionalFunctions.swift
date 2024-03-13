//
//  returnConditionalFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 10/19/23.
//

import Foundation
import RealmSwift

extension Character {
    func returnAllConditionalChanges() -> RealmSwift.List<CharacterConditionalChange> {
        let conditionalChanges = RealmSwift.List<CharacterConditionalChange>()
        for cAbility in getAllClassAbilities(excludeRoute: nil) {
            if cAbility.effects != nil {
                for cChange in cAbility.effects!.conditionalChanges {
                    conditionalChanges.append(cChange)
                }
            }
        }
        for feat in getAllFeats(excludeRoute: nil) {
            if feat.effects != nil {
                for cChange in feat.effects!.conditionalChanges {
                    conditionalChanges.append(cChange)
                }
            }
        }
        return conditionalChanges
    }
    func returnUnselectedConditionalsWithChoice() -> RealmSwift.List<CharacterConditionalChange> {
        let conditionalChanges = RealmSwift.List<CharacterConditionalChange>()
        for condition in returnAllConditionalChanges() {
            if condition.selectedLevel == nil && condition.containsSelection {
                conditionalChanges.append(condition)
            }
        }
        return conditionalChanges
    }
    func returnConditionalsThatNeedSelection() -> RealmSwift.List<CharacterConditionalChange> {
        let conditionalChanges = RealmSwift.List<CharacterConditionalChange>()
        for conditionalChange in returnUnselectedConditionalsWithChoice() {
            if conditionalChangeConditionsMet(conditionalChange: conditionalChange) {
                conditionalChanges.append(conditionalChange)
            }
        }
        return conditionalChanges
    }
    func conditionalChangeConditionsMet(conditionalChange: CharacterConditionalChange) -> Bool {
        if conditionalChange.hasLevelGreaterThan != nil {
            if level < conditionalChange.hasLevelGreaterThan! {
                return false
            }
        }
        if conditionalChange.hasLevelLessThan != nil {
            if level > conditionalChange.hasLevelLessThan! {
                return false
            }
        }
        if conditionalChange.hasLevel != nil {
            if level != conditionalChange.hasLevel! {
                return false
            }
        }
        if conditionalChange.hasClassAbility.count > 0 {
            let classAbilities = getAllClassAbilities(excludeRoute: nil)
            for name in conditionalChange.hasClassAbility {
                if classAbilities.filter("name == %@",name).isEmpty {
                    return false
                }
            }
        }
        if conditionalChange.doesNothaveClassAbility.count > 0 {
            let classAbilities = getAllClassAbilities(excludeRoute: nil)
            for name in conditionalChange.doesNothaveClassAbility {
                if !classAbilities.filter("name == %@",name).isEmpty {
                    return false
                }
            }
        }
        if conditionalChange.hasFeat.count > 0 {
            let feats = getAllFeats(excludeRoute: nil)
            for name in conditionalChange.hasFeat {
                if feats.filter("name == %@",name).isEmpty {
                    return false
                }
            }
        }
        if conditionalChange.doesNotHaveFeat.count > 0 {
            let feats = getAllFeats(excludeRoute: nil)
            for name in conditionalChange.doesNotHaveFeat {
                if !feats.filter("name == %@",name).isEmpty {
                    return false
                }
            }
        }
        if conditionalChange.doesNotHaveFocusPoint {
            if hasFocusPoint() {
                return false
            }
        }
        if conditionalChange.hasHeritage.count > 0 {
            for h in conditionalChange.hasHeritage {
                if heritage != nil {
                    if heritage!.name != h {
                        return false
                    }
                } else if versatileHeritage != nil {
                    if versatileHeritage!.name != h {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        if conditionalChange.hasProf.count > 0 {
            for prof in conditionalChange.hasProf {
                switch prof.type {
                case "Skill":
                    if returnSkillProficiency(skill: prof.name!, excludeRoute: nil) != prof.prof {
                        return false
                    }
                case "Armor Category":
                    if returnArmorCategoryProf(category: prof.name!) != prof.prof {
                        return false
                    }
                case "Weapon Category":
                    if returnWeaponCategoryProf(weaponCategory: prof.name!) != prof.prof {
                        return false
                    }
                default:
                    continue
                }
            }
        }
        if conditionalChange.hasProfOrHigher.count > 0 {
            for prof in conditionalChange.hasProf {
                switch prof.type {
                case "Skill":
                    if !checkIfProfEqualOrHigher(characterProf: returnSkillProficiency(skill: prof.name!, excludeRoute: nil), checkProf: prof.prof) {
                        return false
                    }
                case "Armor Category":
                    if !checkIfProfEqualOrHigher(characterProf: returnArmorCategoryProf(category: prof.name!), checkProf: prof.prof) {
                        return false
                    }
                case "Weapon Category":
                    if !checkIfProfEqualOrHigher(characterProf: returnWeaponCategoryProf(weaponCategory: prof.name!), checkProf: prof.prof) {
                        return false
                    }
                default:
                    continue
                }
            }
        }
        if conditionalChange.inRage {
            if !isRaging() {
                return false
            }
        }
        if conditionalChange.inOverdrive {
            if !inOverdrive() {
                return false
            }
        }
        if conditionalChange.isUnarmored {
            if !isUnarmored() {
                return false
            }
        }
        if conditionalChange.hasLowLightVision {
            if !hasLowLightVision() {
                return false
            }
        }
        return true
    }
    func returnContainingFunction(containerKey: ObjectId) -> (feat: CharacterFeat?, classAbility: CharacterClassAbility?, currentClass: CharacterClass?, ancestry: CharacterAncestry?, heritage: CharacterHeritage?, versatileHeritage: CharacterVersatileHeritage?, background: CharacterBackground?) {
        var cFeat: CharacterFeat? = nil
        var cClassAbility: CharacterClassAbility? = nil
        var cClass: CharacterClass? = nil
        var cAncestry: CharacterAncestry? = nil
        var cHeritage: CharacterHeritage? = nil
        var cVersatileHeritage: CharacterVersatileHeritage? = nil
        var cBackground: CharacterBackground? = nil
        for feat in getAllFeats(excludeRoute: nil) {
            if feat.key == containerKey {
                cFeat = feat
            }
        }
        for classAbility in getAllClassAbilities(excludeRoute: nil) {
            if classAbility.key == containerKey {
                cClassAbility = classAbility
            }
        }
        if currentClass != nil {
            if currentClass!.key == containerKey {
                cClass = currentClass
            }
        }
        if ancestry != nil {
            if ancestry!.key == containerKey {
                cAncestry = ancestry!
            }
        }
        if heritage != nil {
            if heritage!.key == containerKey {
                cHeritage = heritage!
            }
        }
        if versatileHeritage != nil {
            if versatileHeritage!.key == containerKey {
                cVersatileHeritage = versatileHeritage!
            }
        }
        if background != nil {
            if background!.key == containerKey {
                cBackground = background!
            }
        }
        return (cFeat, cClassAbility, cClass, cAncestry, cHeritage, cVersatileHeritage, cBackground)
    }
    func returnMatchingConditionalChange(conditionalChange: CharacterConditionalChange) -> ConditionalChanges? {
        let data = LoadDataModel()
        let (feat, classAbility, currentClass, ancestry, heritage, versatileHeritage, background) = returnContainingFunction(containerKey: conditionalChange.containerKey)
        var conditionalChanges = List<ConditionalChanges>()
        if feat != nil {
            conditionalChanges = data.feats.filter("name == %@", feat!.name)[0].effects!.conditionalChange
        }
        if classAbility != nil {
            conditionalChanges = data.classAbilities.filter("name == %@", classAbility!.name)[0].effects!.conditionalChange
        }
        if currentClass != nil {
            conditionalChanges = data.classes.filter("name == %@", currentClass!.name)[0].effects!.conditionalChange
        }
        if ancestry != nil {
            conditionalChanges = data.ancestries.filter("name == %@", ancestry!.name)[0].effects!.conditionalChange
        }
        if heritage != nil {
            conditionalChanges = data.heritages.filter("name == %@", heritage!.name)[0].effects!.conditionalChange
        }
        if versatileHeritage != nil {
            conditionalChanges = data.versatileHeritages.filter("name == %@", versatileHeritage!.name)[0].effects!.conditionalChange
        }
        if background != nil {
            conditionalChanges = data.backgrounds.filter("name == %@", background!.name)[0].effects!.conditionalChange
        }
        for cChange in conditionalChanges {
            if cChange.hasLowLightVision == conditionalChange.hasLowLightVision && cChange.isUnarmored == conditionalChange.isUnarmored && cChange.inOverdrive == conditionalChange.inOverdrive && cChange.inRage == conditionalChange.inRage && cChange.doesNotHaveFocusPoint == conditionalChange.doesNotHaveFocusPoint && cChange.hasLevelGreaterThan == conditionalChange.hasLevelGreaterThan && cChange.hasLevelLessThan == conditionalChange.hasLevelLessThan && cChange.hasLevel == conditionalChange.hasLevel && cChange.doesNotHaveFocusPoint == conditionalChange.doesNotHaveFocusPoint && Array(cChange.hasClassAbility) == Array(conditionalChange.hasClassAbility) && Array(cChange.doesNothaveClassAbility) == Array(conditionalChange.doesNothaveClassAbility) && Array(cChange.hasFeat) == Array(conditionalChange.hasFeat) && Array(cChange.doesNotHaveFeat) == Array(conditionalChange.doesNotHaveFeat) && Array(cChange.hasHeritage) == Array(conditionalChange.hasHeritage) && Array(cChange.hasProf) == Array(conditionalChange.hasProf) && Array(cChange.hasProfOrHigher) == Array(conditionalChange.hasProfOrHigher) {
                return cChange
            }
        }
        return nil
    }
    func returnContainingDescription(conditionalChange: CharacterConditionalChange) -> String? {
        let (feat, classAbility, currentClass, ancestry, heritage, versatileHeritage, background) = returnContainingFunction(containerKey: conditionalChange.containerKey)
        var desc: String? = nil
        if feat != nil {
            desc = feat!.descriptions
        }
        if classAbility != nil {
            desc = classAbility!.descriptions
        }
        if currentClass != nil {
            desc = currentClass!.descriptions
        }
        if ancestry != nil {
            desc = ancestry!.descriptions
        }
        if heritage != nil {
            desc = heritage!.descriptions
        }
        if versatileHeritage != nil {
            desc = versatileHeritage!.descriptions
        }
        if background != nil {
            desc = background!.descriptions
        }
        return desc
    }
    func returnContainingName(conditionalChange: CharacterConditionalChange) -> String? {
        let (feat, classAbility, currentClass, ancestry, heritage, versatileHeritage, background) = returnContainingFunction(containerKey: conditionalChange.containerKey)
        var desc: String? = nil
        if feat != nil {
            desc = feat!.name
        }
        if classAbility != nil {
            desc = classAbility!.name
        }
        if currentClass != nil {
            desc = currentClass!.name
        }
        if ancestry != nil {
            desc = ancestry!.name
        }
        if heritage != nil {
            desc = heritage!.name
        }
        if versatileHeritage != nil {
            desc = versatileHeritage!.name
        }
        if background != nil {
            desc = background!.name
        }
        return desc
    }
}
