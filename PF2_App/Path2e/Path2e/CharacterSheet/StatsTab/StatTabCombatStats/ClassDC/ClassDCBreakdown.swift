//
//  ClassDCBreakdown.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ClassDCBreakdownView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(realmManager.character.returnClassDCModifier(excludeRoute: nil)))
                }
                HStack {
                    Text("Base")
                    Spacer()
                    Text("10")
                }
                HStack {
                    Text("Proficiency Modifier (\(realmManager.character.returnClassDCProf(excludeRoute: nil)))")
                    Spacer()
                    Text(String(realmManager.character.returnClassDCProfValue(excludeRoute: nil)))
                }
                HStack {
                    Text("Key Ability Modifier (\(realmManager.character.returnKeyAbility().prefix(3).capitalized))")
                    Spacer()
                    Text(String(realmManager.character.returnAbilityScoreMod(ability: realmManager.character.returnKeyAbility(), excludeRoute: nil)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.customClassDCScore))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomClassDC(id: realmManager.character.id, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomClassDC(id: realmManager.character.id, increment: false)
                    }
                }
            }
            .navigationBarTitle("ClassDC", displayMode: .inline)
        }
    }
}
