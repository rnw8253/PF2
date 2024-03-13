//
//  FeatDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 8/14/22.
//

import SwiftUI
import RealmSwift

struct FeatView: View {
    // Variables Being Passed In for this feat
    var feat: FeatData
    @StateObject var chosenFeatures = ChosenFeaturesModel()
    var body: some View {
        VStack {
            List {
                
                FeatBasicDisplays(feat: feat)
                
                FeatActionDisplays(feat: feat)
                
                if feat.effects != nil {
                    EffectDisplay(effects: feat.effects!, chosenFeatures: chosenFeatures)
                }
                
                FeatDescriptionDisplays(feat: feat)
                
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(feat.name, displayMode: .inline)
        .padding(.bottom)
    }
}
