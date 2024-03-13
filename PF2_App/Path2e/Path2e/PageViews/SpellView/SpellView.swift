//
//  SpellDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SpellView: View {
    var spell: SpellData
    var body: some View {
        List {
            SpellCastingDisplays(spell: spell)
            Section(header: Text("Description")) {
                Text(spell.descriptions)
            }
            SpellHeightenedDisplays(spell: spell)
            SpellBasicDisplay(spell: spell)
            SpellTraitDisplays(spell: spell)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(spell.name, displayMode: .inline)
        .padding(.bottom)
    }
}


