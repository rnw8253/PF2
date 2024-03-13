//
//  ConditionDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift

struct ConditionView: View {
    var condition: ConditionData
    @StateObject var chosenFeatures = ChosenFeaturesModel()
    var body: some View {
        VStack {
            List {
                if condition.effects != nil {
                    EffectDisplay(effects: condition.effects!, chosenFeatures: chosenFeatures)
                }
                Section(header: Text("Description")) {
                    Text(condition.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(condition.name, displayMode: .inline)
        .padding(.bottom)
    }
}
