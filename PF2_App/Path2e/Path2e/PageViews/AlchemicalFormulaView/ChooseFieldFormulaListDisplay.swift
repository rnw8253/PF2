//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct ChooseFieldFormulaListDisplay: View {
    var type: String
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    var index: Int
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var formulas: Results<ItemData> {
        var allItems = data.items.where {
            $0.level == 1
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
        switch type {
        case "Bomb":
            return allItems.where {
                $0.traits.contains(401)
            }
        case "Elixer":
            return allItems.where {
                $0.traits.contains(200)
            }
        case "Mutagen":
            return allItems.where {
                $0.traits.contains(536)
            }
        case "Poison":
            return allItems.where {
                $0.traits.contains(331) && !$0.traits.containsAny(in: [401,842])
            }
        default:
            return allItems
        }
    }
    var body: some View {
        VStack {
            List {
                ForEach(formulas.sorted(byKeyPath: "name"), id: \.self) { f in
                    NavigationLink(value: Route.formulaSelectionView(item: f, index: index, type: .fieldFormula, chosenFeature: chosenFeatures)) {
                        FormulaListButtonView(formula: f)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Formulas", displayMode: .inline)
            .padding(.bottom)
        }
    }
}

