//
//  DisplayEffects.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct EffectDisplay: View {
    var effects: Coding
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    var body: some View {
        ModificationDisplay(modifications: effects.modification)
        TemporaryModificationDisplay(modifications: effects.temporaryModification)
        TemporaryEffectDisplay(modifications: effects.temporaryEffect)
        if effects.feat != nil {
            FeatDisplay(feats: effects.feat!, chosenFeatures: chosenFeatures)
        }

        if effects.skill != nil {
            SkillDisplay(skills: effects.skill!, chosenFeatures: chosenFeatures)
        }
        if effects.spell != nil {
            SpellDisplay(spells: effects.spell!, chosenFeatures: chosenFeatures)
        }
        if effects.weaponAndArmor != nil {
            WeaponAndArmorDisplay(waa: effects.weaponAndArmor!, chosenFeatures: chosenFeatures)
        }
        if effects.feature != nil {
            FeatureDisplay(feature: effects.feature!, chosenFeatures: chosenFeatures)
        }
        if effects.conditionalChange.count > 0 {
            ConditionalDisplay(conditionalChanges: effects.conditionalChange, chosenFeatures: chosenFeatures)
        }
        //        OtherDisplay()
    }
}


