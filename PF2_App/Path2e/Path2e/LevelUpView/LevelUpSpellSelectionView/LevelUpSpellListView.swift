//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct LevelUpSpellListView: View {
    let spellList: CharacterSpellList
    let listSpell: CharacterListSpell
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var spells: Results<SpellData> {
        var spells = data.spells.where {
            $0.level > -1 && $0.level <= listSpell.spellLevel
        }
        spells = spells.where {
            $0.rarity == "Common" || $0.rarity == "COMMON"
        }
        if listSpell.spellLevel != 0 {
            spells = spells.where {
                $0.level > 0 && $0.level <= listSpell.spellLevel
            }
        }
        if spellList.spellCastingType == "Spontaneous-Repertoire" {
            spells = spells.where {
                !$0.id.in(spellList.returnSpellIDsLevel(level: listSpell.spellLevel))
            }
        } else {
            spells = spells.where {
                !$0.id.in(spellList.returnSpellIDs())
            }
        }
        for spell in realmManager.character.returnAddSpellsToList(spellLevel: listSpell.spellLevel) {
            spells = spells.where {
                $0.id != spell.id
            }
        }
        if spellList.tradition != nil {
            return spells.where {
                $0.traditions.contains(spellList.tradition!)
            }
        } else {
            switch spellList.school! {
            case "Abjuration":
                return spells.where {
                    $0.traitIDs.contains(1)
                }
            case "Divination":
                return spells.where {
                    $0.traitIDs.contains(228)
                }
            case "Transmutation":
                return spells.where {
                    $0.traitIDs.contains(182)
                }
            case "Necromancy":
                return spells.where {
                    $0.traitIDs.contains(122)
                }
            case "Illusion":
                return spells.where {
                    $0.traitIDs.contains(120)
                }
            case "Evocation":
                return spells.where {
                    $0.traitIDs.contains(231)
                }
            case "Enchantment":
                return spells.where {
                    $0.traitIDs.contains(130)
                }
            case "Conjuration":
                return spells.where {
                    $0.traitIDs.contains(39)
                }
            default:
                return spells
            }
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
                            NavigationLink(value: Route.levelUpSpellSelectionView(spell: s, spellList: spellList, listSpell: listSpell)) {
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
