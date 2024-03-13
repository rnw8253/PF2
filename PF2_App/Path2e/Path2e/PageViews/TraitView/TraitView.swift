//
//  TraitDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/20/22.
//

import SwiftUI

struct TraitView: View {
    var trait: TraitData
    var body: some View {
        VStack {
            List {
                Section(header: Text("Description")) {
                    Text(trait.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(trait.name, displayMode: .inline)
        .padding(.bottom)
    }
}

