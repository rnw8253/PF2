//
//  FeatDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct FeatDisplay: View {
    var feats: Feat
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        Section(header: Text("Feats")) {
            if feats.choose.count > 0 {
                ForEach(Array(feats.choose.enumerated()), id: \.element) { index, feat in
                    NavigationLink(value: Route.chooseFeatListDisplay(selection: feat, chosenFeat: chosenFeatures.chooseFeat[index])) {
                        HStack {
                            Text(chosenFeatures.chooseFeat[index].feat?.name == nil ? "Select \(feat.type) Feat" : "\(feat.type) Feat")
                                .foregroundColor(chosenFeatures.chooseFeat[index].feat?.name == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.chooseFeat[index].feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            if feats.chooseFromList.count > 0 {
                ForEach(Array(feats.chooseFromList.enumerated()), id: \.element) { index, feat in
                    NavigationLink(value: Route.chooseFeatFromListDisplay(selection: feat, chosenFeat: chosenFeatures.chooseFeatFromList[index])) {
                        HStack {
                            Text(feat.choice)
                                .foregroundColor(chosenFeatures.chooseFeatFromList[index].feat?.name == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.chooseFeatFromList[index].feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            if feats.give.count > 0 {
                ForEach(Array(feats.give.enumerated()), id: \.element) { index, feat in
                    let filteredFeats = data.feats.filter("name == %@", feat).sorted { $0.level < $1.level }
                    if filteredFeats.count > 0 {
                        NavigationLink(value: Route.featSelectionView(feat: filteredFeats[0], chosenFeat: chosenFeatures.giveFeat[index], popValue: 1)) {
                            HStack {
                                Text(chosenFeatures.giveFeat[index].feat?.name == nil ? "Gain Feat" : "Feat")
                                    .foregroundColor(chosenFeatures.giveFeat[index].feat?.name == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                Text(chosenFeatures.giveFeat[index].feat?.name ?? "Unselected")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            if feats.overrideFeatLevel != nil {
                HStack {
                    Text("Override Feat Level")
                    Spacer()
                    Text("\(feats.overrideFeatLevel!.name) \(feats.overrideFeatLevel!.level)")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
