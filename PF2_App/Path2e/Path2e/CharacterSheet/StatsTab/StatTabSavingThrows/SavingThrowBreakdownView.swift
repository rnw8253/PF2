//
//  SavingThrowBreakdown.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation

import SwiftUI
import RealmSwift

struct SavingThrowBreakdown: View {
    var savingThrow: String
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(realmManager.character.returnSavingThrowTotal(save: savingThrow, excludeRoute: nil)))
                }
                HStack {
                    Text("Proficiency Modifier (\(realmManager.character.returnSavingThrowProf(save: savingThrow, excludeRoute: nil)))")
                    Spacer()
                    Text(String(realmManager.character.returnSavingThrowProfValue(save: savingThrow, excludeRoute: nil)))
                }
                HStack {
                    Text("Ability Modifier (\(realmManager.character.returnSavingThrowModType(save: savingThrow).prefix(3).capitalized))")
                    Spacer()
                    Text(String(realmManager.character.returnSavingThrowModValue(save: savingThrow, excludeRoute: nil)))
                }
                HStack {
                    Text("Bonus Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnSavingThrowModifications(save: savingThrow, excludeRoute: nil)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.returnSavingThrowCustomValue(save: savingThrow)))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomSavingThrow(id: realmManager.character.id, savingThrow: savingThrow, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomSavingThrow(id: realmManager.character.id, savingThrow: savingThrow, increment: false)
                    }
                }
                Section(header: Text("Temporary Bonus Modifiers")) {
                    ForEach(realmManager.character.returnSavingThrowTempModifications(save: savingThrow, excludeRoute: nil), id: \.self) { mod in
                        Text("\(signInt(mod.value)) \(mod.condition)")
                    }
                }
                Section(header: Text("Temporary Bonus Effects")) {
                    ForEach(realmManager.character.returnSavingThrowTempEffects(save: savingThrow, excludeRoute: nil), id: \.self) { mod in
                        Text("\(mod.effect)")
                    }
                }
            }
            .navigationBarTitle(savingThrow, displayMode: .inline)
        }
    }
}
