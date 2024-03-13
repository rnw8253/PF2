//
//  AncestryStatFeatListDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryFeatDisplay: View {
    let ancestry: AncestryData
    var body: some View {
        Section(header: Text("Feats")) {
            NavigationLink(value: Route.ancestryFeatListDisplay(ancestry: ancestry)) {
                Text("\(ancestry.name.capitalized) Feats")
            }
        }
    }
}
