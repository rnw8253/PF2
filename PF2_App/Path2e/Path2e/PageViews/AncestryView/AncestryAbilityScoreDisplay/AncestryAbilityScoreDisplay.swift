//
//  AncestryStatAbilityDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryAbilityScoreDisplay: View {
    let ancestry: AncestryData
    @ObservedObject var chosenAncestry: ChosenAncestryModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var preferences: Preferences
    var rarity = ["Strength","Constitution","Dexterity","Intelligence","Wisdom","Charisma"]
    @State var value = false
    var body: some View {
        Section(header: Text("Abilities")) {
            NavigationLink(value: Route.abilityBoostSelectionView(count: ancestry.boosts.filter { $0 == "Anything" }.count, options: nil, boosts: convertToStringList(names: ancestry.boosts)!, flaw: ancestry.flaws, chosenAbilityBoosts: chosenAncestry.abilityBoost)) {
                HStack {
                    Text(chosenAncestry.abilityBoost.returnAbilityBoosts() == "Unselected" ? "Select Ability Boost" : "Ability Boost")
                        .foregroundColor(chosenAncestry.abilityBoost.returnAbilityBoosts() == "Unselected" ? preferences.unselectedColor : preferences.selectedColor)
                    Spacer()
                    Text(chosenAncestry.abilityBoost.returnAbilityBoosts())
                        .foregroundColor(.secondary)
                }
            }
            ForEach(ancestry.boosts, id: \.self) { boost in
                if boost  != "Anything" {
                    HStack {
                        Text("Boost")
                        Spacer()
                        Text(boost.capitalized.prefix(3))
                            .foregroundColor(.secondary)
                    }
                }
            }
        
            if ancestry.flaws != nil {
                HStack {
                    Text("Flaw")
                    Spacer()
                    Text(ancestry.flaws!.capitalized.prefix(3))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

