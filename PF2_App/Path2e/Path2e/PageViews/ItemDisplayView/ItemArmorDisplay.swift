//
//  ItemArmorDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemArmorDisplay: View {
    let armor: Armor
    var body: some View {
        Section(header: Text("Armor")) {
            HStack {
                Text("Armor Type")
                Spacer()
                Text(armor.armorType.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Proficiency Type")
                Spacer()
                Text(armor.profName.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Category")
                Spacer()
                Text(armor.category.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("AC Bonus")
                Spacer()
                Text(String(armor.acBonus))
                    .foregroundColor(.secondary)
            }
            if armor.dexCap != nil {
                HStack {
                    Text("Dexterity Cap")
                    Spacer()
                    Text(String(armor.dexCap!))
                        .foregroundColor(.secondary)
                }
            }
            HStack {
                Text("Strength Requirement")
                Spacer()
                Text(String(armor.minStrength))
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Check Penalty")
                Spacer()
                Text(String(armor.checkPenalty))
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Speed Penalty")
                Spacer()
                Text(String(armor.speedPenalty))
                    .foregroundColor(.secondary)
            }
        }
    }
}
