//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalFeatDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(Array(conditionalChanges.enumerated()), id: \.element) { index, conditionalChange in
            if conditionalChange.giveFeatName != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    NavigationLink(value: Route.featSelectionView(feat: data.feats.filter("name ==[c] %@",conditionalChange.giveFeatName!)[0], chosenFeat: chosenFeatures.ifGiveFeat[index], popValue: 1)) {
                        HStack {
                            Text(chosenFeatures.ifGiveFeat[index].feat?.name == nil ? "Gain Feat" : "Feat")
                                .foregroundColor(chosenFeatures.ifGiveFeat[index].feat?.name == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.ifGiveFeat[index].feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            } else if conditionalChange.elseGiveFeatName != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    NavigationLink(value: Route.featSelectionView(feat: data.feats.filter("name ==[c] %@",conditionalChange.elseGiveFeatName!)[0], chosenFeat: chosenFeatures.elseGiveFeat[index], popValue: 1)) {
                        HStack {
                            Text(chosenFeatures.elseGiveFeat[index].feat?.name == nil ? "Gain Feat" : "Feat")
                                .foregroundColor(chosenFeatures.elseGiveFeat[index].feat?.name == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.elseGiveFeat[index].feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

//@Persisted var chooseFeatFromList: ChooseFeatFromList? = nil
//@Persisted var giveFeatName: String? = nil
//@Persisted var chooseFeat: ChooseFeat? = nil
//@Persisted var elseGiveFeatName: String? = nil
//@Persisted var elseChooseFeatFromList: ChooseFeatFromList? = nil
