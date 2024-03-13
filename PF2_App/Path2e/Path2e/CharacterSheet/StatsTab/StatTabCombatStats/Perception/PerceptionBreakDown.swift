//
//  PerceptionBreakDown.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct PerceptionBreakdownView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(realmManager.character.returnPerceptionModifier(excludeRoute: nil)))
                }
                HStack {
                    Text("Proficiency Modifier (\(realmManager.character.returnPerceptionProf(excludeRoute: nil)))")
                    Spacer()
                    Text(String(realmManager.character.returnPerceptionProfValue(excludeRoute: nil)))
                }
                HStack {
                    Text("Ability Modifier (Wis)")
                    Spacer()
                    Text(String(realmManager.character.returnAbilityScoreMod(ability: "Wisdom", excludeRoute: nil)))
                }
                HStack {
                    Text("Bonus Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnPerceptionBonusValue(excludeRoute: nil)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.customPerceptionScore))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomPerception(id: realmManager.character.id, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomPerception(id: realmManager.character.id, increment: false)
                    }
                }
                Section(header: Text("Temporary Bonus Modifiers")) {
                    ForEach(realmManager.character.returnPerceptionTempModifications(excludeRoute: nil), id: \.self) { mod in
                        Text("\(signInt(mod.value)) \(mod.condition)")
                    }
                }
            }
            .navigationBarTitle("Perception", displayMode: .inline)
        }
    }
}
