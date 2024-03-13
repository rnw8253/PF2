//
//  AncestryStatBasicDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryBasicDisplay: View {
    let ancestry: AncestryData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        Section(header: Text("Basic Info")) {
            HStack {
                Text("Source")
                Spacer()
                Text(ancestry.contentSrc)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Size")
                Spacer()
                Text(ancestry.size.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Hit Points")
                Spacer()
                Text(String(ancestry.hitPoints))
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Speed")
                Spacer()
                Text(String(ancestry.speed))
                    .foregroundColor(.secondary)
            }
            let trait = data.traits.filter("id == %@",ancestry.tagID)[0]
            NavigationLink(value: Route.traitView(trait: trait)) {
                HStack {
                    Text("Trait")
                    Spacer()
                    Text(trait.name)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
