//
//  ACBreakdown.swift
//  Path2e
//
//  Created by Ryan Weber on 11/27/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ACBreakdownView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(realmManager.character.returnAC(excludeRoute: nil)))
                }
                HStack {
                    Text("Base")
                    Spacer()
                    Text("10")
                }
                HStack {
                    Text("Proficiency Modifier (\(realmManager.character.returnArmorProf(excludeRoute: nil)))")
                    Spacer()
                    Text(String(realmManager.character.returnArmorProfValue(excludeRoute: nil)))
                }
                HStack {
                    if realmManager.character.returnArmorDexCap() == nil {
                        Text("Ability Modifier (Dex)")
                    } else {
                        Text("Dexterity Modifier (Dex Cap: \(realmManager.character.returnArmorDexCap()!))")
                    }
                    Spacer()
                    Text(String(realmManager.character.returnArmorDexValue()))
                }
                HStack {
                    Text("Armor Bonus")
                    Spacer()
                    Text(String(realmManager.character.returnArmorBonus()))
                }
                HStack {
                    Text("Bonus Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnACModifications(excludeRoute: nil)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.customACScore))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomAC(id: realmManager.character.id, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomAC(id: realmManager.character.id, increment: false)
                    }
                }
                Section(header: Text("Temporary Bonus Modifiers")) {
                    ForEach(realmManager.character.returnACTempModifications(excludeRoute: nil), id: \.self) { mod in
                        Text("\(signInt(mod.value)) \(mod.condition)")
                    }
                }
            }
            .navigationBarTitle("Armor Class", displayMode: .inline)
        }
    }
}
