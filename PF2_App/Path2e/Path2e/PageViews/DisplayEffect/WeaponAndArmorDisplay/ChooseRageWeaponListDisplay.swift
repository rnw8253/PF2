//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct ChooseRageWeaponDisplay: View {
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var data: LoadDataModel
    @State var filter = "Melee"
    var weapons: Results<ItemData> {
        var allItems =  data.items.where {
            $0.weapon != nil
        }
        allItems = allItems.where {
            $0.level == 0
        }
        allItems = allItems.where {
            !($0.traits.containsAny(in: [402,399]))
        }
        allItems = allItems.where {
            $0.weapon.category != "Unarmed"
        }
        allItems = allItems.where {
            $0.weapon.category != "UNARMED"
        }
        allItems = allItems.where {
            $0.rarity == "COMMON"
        }
        switch filter {
        case "Melee":
            return allItems.where {
                $0.weapon.isMelee == true
            }
        case "Ranged":
            return allItems.where {
                $0.weapon.isRanged == true
            }
        default:
            return allItems
        }
    }
    var body: some View {
        VStack {
            Picker("Sort Weapon List", selection: $filter) {
                Text("Melee").tag("Melee")
                Text("Ranged").tag("Ranged")
                Text("All").tag("All")
            }
            .pickerStyle(.segmented)
            List {
                ForEach(weapons.sorted(byKeyPath: "name"), id: \.self) { w in
                    NavigationLink(value: Route.itemSelectionView(item: w, chosenFeature: chosenFeatures)) {
                        HStack {
                            Text(w.name)
                            Spacer()
                            VStack {
                                Text(w.weapon!.category.capitalized)
                                Text("Category")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: 80)
                            VStack {
                                switch w.hands!.capitalized {
                                case "One":
                                    Text("1")
                                case "One_Plus":
                                    Text("+1")
                                case "Two":
                                    Text("2")
                                case "None":
                                    Text("0")
                                default:
                                    Text("0")
                                }
                                
                                Text("Hands")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: 35)
                            VStack {
                                if w.weapon!.dieType != "EMPTY_ENUM_VALUE" && w.weapon!.dieType != "NONE" {
                                    Text("\(w.weapon!.diceNum)\(w.weapon!.dieType) \(w.weapon!.damageType)")
                                } else {
                                    Text(" ")
                                }
                                Text("Damage")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: 55)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weapons", displayMode: .inline)
            .padding(.bottom)
        }
    }
}

