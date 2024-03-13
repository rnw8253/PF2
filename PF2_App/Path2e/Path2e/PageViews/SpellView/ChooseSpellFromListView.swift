

import Foundation
import RealmSwift
import SwiftUI


struct ChooseSpellFromListView: View {
    var selection: ChooseSpellFromList
    @ObservedObject var chosenSpell: ChosenSpellModel
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            ForEach(selection.options, id: \.self) { name in
                let filteredSpells = data.spells.filter("name == %@", name)[0]
                NavigationLink(value: Route.spellSelectionView(spell: filteredSpells, chosenSpell: chosenSpell)) {
                    SpellListButtonDisplay(spell: filteredSpells)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Choose a Spell", displayMode: .inline)
        .padding(.bottom)
    }
}

