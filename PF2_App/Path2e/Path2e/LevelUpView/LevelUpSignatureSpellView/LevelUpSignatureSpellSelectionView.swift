//
//  SpellDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpSignatureSpellSelectionView: View {
    let spell: SpellData
    let spellList: CharacterSpellList
    let spellLevel: Int
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        VStack {
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
            Button {
                realmManager.updateCharacterSignatureSpell(id: realmManager.character.id, spellList: spellList, level: realmManager.character.level, spellLevel: spellLevel, spellID: spell.id)
                appState.popXViews(2)
            } label: {
                Text("Choose Spell")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Capsule())
            }
        }
    }
}
