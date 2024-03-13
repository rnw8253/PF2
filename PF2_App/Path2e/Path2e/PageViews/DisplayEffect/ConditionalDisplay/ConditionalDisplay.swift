//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            ConditionalFeatureDisplay(conditionalChanges: conditionalChanges)
            ConditionalFeatDisplay(conditionalChanges: conditionalChanges, chosenFeatures: chosenFeatures)
            ConditionalSpellDisplay(conditionalChanges: conditionalChanges)
        } label: {
            Text("Conditional Changes")
        }
 
//            ForEach(conditionalChange.modification, id: \.self) { modification in
//                SingleModificationDisplay(mod: modification)
//            }
//            
//            ConditionalSpellDisplay(conditionalChange: conditionalChange)
            
//            ConditionalProficiencyDisplay(conditionalChange: conditionalChange)

//            ConditionalSkillDisplay(conditionalChange: conditionalChange)
//            
//            ConditionalFeatDisplay(conditionalChange: conditionalChange, character: character)
//            
//            ConditionalWAADisplay(conditionalChange: conditionalChange)
//            
//            ConditionalOtherDisplay(conditionalChange: conditionalChange)
//            
//            ConditionalTemporaryDisplay(conditionalChange: conditionalChange)

    }
}

