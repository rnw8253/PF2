//
//  ConditionDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift

struct SenseView: View {
    var sense: AncestryAdditionalSense
    var body: some View {
        VStack {
            List {
                Section(header: Text("Description")) {
                    Text(sense.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(sense.name, displayMode: .inline)
        .padding(.bottom)
    }
}
