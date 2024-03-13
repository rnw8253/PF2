//
//  SpellTraitDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/22/23.
//

import SwiftUI
import RealmSwift

struct SpellTraitDisplays: View {
    let spell: SpellData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        if spell.traitIDs.count > 0 {
            Section(header: Text("Traits")) {
                ForEach(spell.traitIDs.indices, id: \.self) {ind in
                    let trait = data.traits.filter("id == %@", spell.traitIDs[ind])[0]
                    NavigationLink(value: Route.traitView(trait: trait)) {
                        HStack {
                            Text(trait.name)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

