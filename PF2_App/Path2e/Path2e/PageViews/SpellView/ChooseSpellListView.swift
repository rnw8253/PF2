//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct ChooseSpellListView: View {
    let chooseSpell: ChooseSpell
    @ObservedObject var chosenSpell: ChosenSpellModel
    @EnvironmentObject var data: LoadDataModel
    var spells: Results<SpellData> {
        return data.spells.where {
            ($0.level <= chooseSpell.level) && ($0.traditions.contains(chooseSpell.tradition))
        }
    }
    var body: some View {
        List {
            let levelList = [10,9,8,7,6,5,4,3,2,1,0]
            ForEach(levelList, id: \.self) { level in
                let subSpells = spells.filter("level == %@", level)
                if subSpells.count > 0 {
                    Section(header: Text("Level \(level)")) {
                        ForEach(subSpells.sorted(byKeyPath: "name"), id: \.self) { s in
                            NavigationLink(value: Route.spellSelectionView(spell: s, chosenSpell: chosenSpell)) {
                                SpellListButtonDisplay(spell: s)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("\(chooseSpell.tradition) Spells", displayMode: .inline)
        .padding(.bottom)
    }
}
