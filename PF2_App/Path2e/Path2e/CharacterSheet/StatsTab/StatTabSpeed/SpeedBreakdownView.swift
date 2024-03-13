//
//  SpeedBreakdown.swift
//  Path2e
//
//  Created by Ryan Weber on 11/28/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct SpeedBreakdownView: View {
    var speedType: String
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(realmManager.character.returnSpeed(type: speedType)))
                }
                HStack {
                    Text("Base Speed")
                    Spacer()
                    Text(String(realmManager.character.returnBaseSpeed(type: speedType)))
                }
                HStack {
                    Text("Bonus Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnSpeedModification(type: speedType)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.returnCustomSpeedValue(type: speedType)))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomSpeed(id: realmManager.character.id, speedType: speedType, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomSpeed(id: realmManager.character.id, speedType: speedType, increment: false)
                    }
                }
                Section(header: Text("Temporary Bonus Modifiers")) {
                    ForEach(realmManager.character.returnSpeedTempModifications(excludeRoute: nil), id: \.self) { mod in
                        Text("\(signInt(mod.value)) \(mod.condition)")
                    }
                }
                Section(header: Text("Temporary Bonus Effects")) {
                    ForEach(realmManager.character.returnSpeedTempEffect(excludeRoute: nil), id: \.self) { mod in
                        Text("\(mod.effect)")
                    }
                }
            }
            .navigationBarTitle(speedType, displayMode: .inline)
        }
    }
}
