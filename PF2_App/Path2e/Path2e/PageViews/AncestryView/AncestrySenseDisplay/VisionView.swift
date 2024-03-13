//
//  ConditionDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift

struct VisionView: View {
    var vision: AncestryVisionSense
    var body: some View {
        VStack {
            List {
                Section(header: Text("Description")) {
                    Text(vision.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(vision.name, displayMode: .inline)
        .padding(.bottom)
    }
}
