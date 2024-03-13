//
//  LevelUpFormulaListView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/20/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct LevelUpFormulaListView: View {
    var listFormula: CharacterListFormula
    var filter: String
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var formulas: Results<ItemData> {
        var allItems = data.items.where {
            $0.level <= listFormula.levelGained
        }
        allItems = allItems.where {
            $0.rarity == "Common" || $0.rarity == "COMMON"
        }
        allItems = allItems.where {
            $0.traits.contains(399)
        }
        allItems = allItems.where {
            !($0.id.in(realmManager.character.formulaList!.returnFormulaIDs()))
        }
        allItems = allItems.where {
            !($0.id.in(realmManager.character.returnFormulaIDs(excludeRoute: appState.path)))
        }
        switch filter {
        case "Bomb":
            return allItems.where {
                $0.traits.contains(401)
            }
        case "Elixer":
            return allItems.where {
                $0.traits.contains(535) && !$0.traits.containsAny(in: [200,536])
            }
        case "Poison":
            return allItems.where {
                $0.traits.contains(331) && !$0.traits.containsAny(in: [401,842]) &&                 !($0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder"))
            }
        case "Drug":
            return allItems.where {
                $0.traits.contains(842)
            }
        case "Healing":
            return allItems.where {
                $0.traits.contains(200) && !($0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder"))
            }
        case "Mutagen":
            return allItems.where {
                $0.traits.contains(536)
            }
        case "Ammunition":
            return allItems.where {
                $0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder")
            }
        case "Monstrocity":
            return allItems.where {
                $0.traits.contains(5002)
            }
        case "Other":
            return allItems.where {
                !$0.traits.containsAny(in: [401,535,536,331,842,5002,200]) &&                 !($0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder"))
            }
        case "All":
            return allItems
        default:
            return allItems
        }
    }
    var body: some View {
        List {
            let levelList = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]
            ForEach(levelList, id: \.self) { level in
                let subFormulas = formulas.filter("level == %@", level)
                if subFormulas.count > 0 {
                    Section(header: Text("Level \(level)")) {
                        ForEach(subFormulas.sorted(byKeyPath: "name"), id: \.self) { f in
                            NavigationLink(value: Route.levelUpFormulaSelectionView(item: f, listFormula: listFormula)) {
                                FormulaListButtonView(formula: f)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct FormulaListButtonView: View {
    let formula: ItemData
    var body: some View {
        HStack {
            if formula.name.contains("Ammunition") || formula.name.contains("Bullet") || formula.name.contains("Shot") || formula.name.contains("Powder") {
                Image("Ammunition")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(401) {
                Image("Bomb")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(842) {
                Image("Drug")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(536) {
                Image("Mutagen")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(200) {
                Image("Healing")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(5002) {
                Image("Monstrocity")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(535) {
                Image("Elixer")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else if formula.traits.contains(331) {
                Image("Poison")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            } else {
                Image("Other")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
            }
            VStack(alignment: .leading) {
                Text(formula.name)
                    .font(.headline)
                Text(String(formula.descriptions.split(separator: "\n", maxSplits: 1).last!))
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .font(.caption)
            }
        }
        .padding([.top, .bottom], 0)
        .frame(height: 25)
    }
}


