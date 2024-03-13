//
//  LevelUpSignatureSpellListView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/13/23.
//

import Foundation
import RealmSwift
import SwiftUI


struct LevelUpSignatureSpellListView: View {
    let spellList: CharacterSpellList
    let spellLevel: Int
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            ForEach(spellList.spells.filter("spellLevel == %@", spellLevel), id: \.self) { characterSpell in
                if characterSpell.id != 0 {
                    let spell = data.spells.filter("id == %@", characterSpell.id)[0]
                    NavigationLink(value: Route.levelUpSignatureSpellSelectionView(spell: spell, spellList: spellList, spellLevel: spellLevel)) {
                        SpellListButtonDisplay(spell: spell)
                    }
                }
            }
            ForEach(realmManager.character.returnAddSpellsToList(spellLevel: spellLevel), id: \.self) { spell in
                NavigationLink(value: Route.levelUpSignatureSpellSelectionView(spell: spell, spellList: spellList, spellLevel: spellLevel)) {
                    SpellListButtonDisplay(spell: spell)
                }
            }
        }
        .navigationBarTitle("Select a Signature Spell", displayMode: .inline)
        .padding(.bottom)
    }
}
