//
//  ItemWeaponDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemWeaponDisplay: View {
    let weapon: Weapon
    var body: some View {
        Section(header: Text("Weapon")) {
            HStack {
                Text("Weapon Type")
                Spacer()
                if weapon.isMelee == true {
                    if weapon.meleeWeaponType != nil {
                        Text(weapon.meleeWeaponType!.capitalized)
                            .foregroundColor(.secondary)
                    }
                }
                if weapon.isRanged == true {
                    Text(weapon.rangedWeaponType!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            HStack {
                Text("Proficiency Type")
                Spacer()
                Text(weapon.profName.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Category")
                Spacer()
                Text(weapon.category.capitalized)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Damage")
                Spacer()
                Text("\(weapon.diceNum)\(weapon.dieType) \(weapon.damageType)")
                    .foregroundColor(.secondary)
            }
            if weapon.isRanged == true {
                HStack {
                    Text("Range")
                    Spacer()
                    Text(String(weapon.range))
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Reload")
                    Spacer()
                    Text(String(weapon.rangedReload))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

