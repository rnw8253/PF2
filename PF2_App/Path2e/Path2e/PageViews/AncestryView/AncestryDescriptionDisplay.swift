//
//  AncestryStatDescriptionDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryDescriptionDisplay: View {
    let ancestry: AncestryData
    var body: some View {
        Section(header: Text("Description")) {
            Image(ancestry.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            Text(ancestry.descriptions)
        }
    }
}
