//
//  AncestryStatFeatListDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryHeritageDisplay: View {
    let ancestry: AncestryData
    var body: some View {
        Section(header: Text("Heritages")) {
            NavigationLink(value: Route.ancestryHeritageListDisplay(ancestry: ancestry)) {
                Text("\(ancestry.name.capitalized) Heritages")
            }
        }
    }
}
