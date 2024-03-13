//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct LevelUpPreparedListListView: View {
    let spellList: CharacterSpellList
    let spellLevel: Int
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var spells: Results<SpellData> {
        var spells = data.spells.where {
            $0.level == spellLevel
        }
        spells = spells.where {
            $0.rarity == "Common" || $0.rarity == "COMMON"
        }
        return spells.where {
            $0.traditions.contains(spellList.tradition!)
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
                            NavigationLink(value: Route.spellView(spell: s)) {
                                SpellListButtonDisplay(spell: s)
                            }
                        }
                    }
                }
            }
            //        .listStyle(GroupedListStyle())
            .navigationBarTitle("Select a Spell", displayMode: .inline)
            .padding(.bottom)
        }
    }
}
