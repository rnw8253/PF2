//
//  AncestryStatPhysicalFeatureDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryStatPhysicalFeatureDisplay: View {
    let ancestry: AncestryData
    @ObservedObject var chosenAncestry: ChosenAncestryModel
    @EnvironmentObject var preferences: Preferences
    var body: some View {
        if ancestry.physicalFeature.count > 0 {
            Section(header: Text("Physical Features")) {
                ForEach(Array(ancestry.physicalFeature.enumerated()), id: \.offset) { index,features in
                    NavigationLink(value: Route.physicalFeatureSelectionDisplay(feature: features, chosenAncestry: chosenAncestry, index: index)) {
                        HStack {
                            Text(chosenAncestry.physicalFeatures[index]?.physicalFeature == nil ? "Select Physical Feature" : "Physical Feature")
                                .foregroundColor(chosenAncestry.physicalFeatures[index]?.physicalFeature == nil ? preferences.unselectedColor : preferences.selectedColor)
                            Spacer()
                            Text(chosenAncestry.physicalFeatures[index]?.physicalFeature?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}
