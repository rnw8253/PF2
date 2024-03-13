//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct ChooseAlchemicalFormulaListDisplay: View {
    var level: Int
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    var index: Int
    var filter: String
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var formulas: Results<ItemData> {
        var allItems = data.items.where {
            $0.level <= level
        }
        allItems = allItems.where {
            $0.traits.contains(399)
        }
        allItems = allItems.where {
            $0.rarity == "Common" || $0.rarity == "COMMON"
        }
        allItems = allItems.where {
            !($0.id.in(realmManager.character.formulaList!.returnFormulaIDs()))
        }
        allItems = allItems.where {
            !($0.id.in(realmManager.character.returnFormulaIDs(excludeRoute: appState.path)))
        }
        for formula in chosenFeatures.alchemicalFormula {
            if formula != nil {
                allItems = allItems.where {
                    $0.id != formula!.id
                }
            }
        }
        for formula in chosenFeatures.fieldFormula {
            if formula != nil {
                allItems = allItems.where {
                    $0.id != formula!.id
                }
            }
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
                $0.traits.contains(331) && !$0.traits.containsAny(in: [401,842]) && !($0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder"))
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
                !$0.traits.containsAny(in: [401,535,536,331,842,5002,200]) && !($0.name.contains("Ammunition") || $0.name.contains("Bullet") || $0.name.contains("Shot") || $0.name.contains("Powder"))
            }
        case "All":
            return allItems
        default:
            return allItems
        }
    }
    var body: some View {
        VStack {
            List {
                let levelList = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]
                ForEach(levelList, id: \.self) { level in
                    let subFormulas = formulas.filter("level == %@", level)
                    if subFormulas.count > 0 {
                        Section(header: Text("Level \(level)")) {
                            ForEach(subFormulas.sorted(byKeyPath: "name"), id: \.self) { f in
                                NavigationLink(value: Route.formulaSelectionView(item: f, index: index, type: .alchemicalFormula, chosenFeature: chosenFeatures)) {
                                    FormulaListButtonView(formula: f)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Formulas", displayMode: .inline)
            .padding(.bottom)
        }
    }
}

