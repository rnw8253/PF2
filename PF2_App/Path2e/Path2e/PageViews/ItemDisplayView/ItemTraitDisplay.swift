//
//  ItemTraitDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI
import RealmSwift

struct ItemTraitDisplay: View {
    let item: ItemData
    @EnvironmentObject var data: LoadDataModel
    var traits: Results<TraitData> {
        return data.traits.where {
            $0.id.in(item.traits)
        }
    }
    var body: some View {
        if traits.count > 0 {
            Section(header: Text("Traits")) {
                ForEach(traits, id: \.self) { trait in
                    NavigationLink(destination: TraitView(trait: trait)) {
                        HStack {
                            Text(trait.name)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
