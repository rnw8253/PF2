//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

struct BackgroundSelectionListDisplay: View {
    @EnvironmentObject var data: LoadDataModel
    @State var filter: String = "All"
    @State var boostFilter: String = "Strength"
    @State var rarityFilter: String = "Common"
    var backgrounds: Results<BackgroundData> {
        switch filter {
        case "All":
            return data.backgrounds
        case "Ability Boosts":
        switch boostFilter {
        case "Strength":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Strength")
            }
        case "Dexterity":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Dexterity")
            }
        case "Constitution":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Constitution")
            }
        case "Wisdom":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Wisdom")
            }
        case "Intelligence":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Intelligence")
            }
        case "Charisma":
            return data.backgrounds.where {
                $0.boosts.abilityBoosts.contains("Charisma")
            }
        default:
            return data.backgrounds
        }
        case "Rarity":
            switch rarityFilter {
            case "Common":
                return data.backgrounds.where {
                    $0.rarity == "Common"
                }
            case "Uncommon":
                return data.backgrounds.where {
                    $0.rarity == "Uncommon"
                }
            case "Rare":
                return data.backgrounds.where {
                    $0.rarity == "Rare"
                }
            default:
                return data.backgrounds
            }
        default:
            return data.backgrounds
        }
    }
    var body: some View {
        VStack {
            Picker("Sort Backgrounds", selection: $filter) {
                Text("All").tag("All")
                Text("Ability Boosts").tag("Ability Boosts")
                Text("Rarity").tag("Rarity")
            }
            .pickerStyle(.segmented)
            if filter == "Ability Boosts" {
                Picker("Choose Ability", selection: $boostFilter) {
                    Text("Strength").tag("Strength")
                    Text("Dexterity").tag("Dexterity")
                    Text("Constitution").tag("Constitution")
                    Text("Wisdom").tag("Wisdom")
                    Text("Intelligence").tag("Intelligence")
                    Text("Charisma").tag("Charisma")
                }
            }
            if filter == "Rarity" {
                Picker("Choose Rarity", selection: $rarityFilter) {
                    Text("Common").tag("Common")
                    Text("Uncommon").tag("Uncommon")
                    Text("Rare").tag("Rare")
                }
            }
            List {
                ForEach(backgrounds.sorted(byKeyPath: "name"), id: \.self) { background in
                    NavigationLink(value: Route.newCharacterBackgroundSelectionView(background: background)) {
                        HStack {
                            Image("BackgroundMarker")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( width: 50, height: 50)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(background.name)
                                    .font(.headline)
                                HStack {
                                    Text("Boosts:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    ForEach(Array(background.boosts.enumerated()), id: \.element) { index, boosts in
                                        if index != 0 {
                                            Text(" - ").foregroundColor(.secondary)
                                        }
                                        if boosts.abilityBoosts.count == 6 {
                                            Text("Free")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        } else {
                                            ForEach(Array(boosts.abilityBoosts.enumerated()), id: \.element) { ind, boost in
                                                if ind != 0 {
                                                    Text("/")
                                                        .foregroundColor(.secondary)
                                                }
                                                if boost == "All" {
                                                    Text("Free")
                                                        .font(.subheadline)
                                                        .foregroundColor(.secondary)
                                                } else {
                                                    Text(boost.prefix(3))
                                                        .font(.subheadline)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
//            .listStyle(GroupedListStyle())
            .navigationBarTitle("Select a Background", displayMode: .inline)
            .padding(.bottom)
        }
    }
}
