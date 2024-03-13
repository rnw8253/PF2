//
//  AbilityScoreBreakdownView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct AbilityScoreBreakdownView: View {
    var ability: String
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Total Score")
                    Spacer()
                    Text("\(realmManager.character.returnAbilityScore(ability: ability, excludeRoute: nil)) (\(realmManager.character.returnAbilityScoreMod(ability: ability, excludeRoute: nil)))")
                }
                HStack {
                    Text("Base Score")
                    Spacer()
                    Text("10")
                }
                HStack {
                    Text("Class Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnClassAbilityScore(ability: ability)))
                }
                HStack {
                    Text("Ancestry Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnAncestryAbilityScore(ability: ability)))
                }
                HStack {
                    Text("Background Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnBackgrounAbilityScore(ability: ability)))
                }
                HStack {
                    Text("Ability Boost Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnAbilityBoostScore(ability: ability, excludeRoute: nil)))
                }
                HStack {
                    Text("Apex Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnApexAbilityScore(ability: ability, excludeRoute: nil)))
                }
                HStack {
                    Text("Condition Modifier")
                    Spacer()
                    Text(String(realmManager.character.returnConditionAbilityScore(ability: ability)))
                }
                Section(header: Text("Custom Modifier")) {
                    Stepper {
                        Text(signInt(realmManager.character.returnAbilityCustomValue(ability: ability)))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomAbilityScore(id: realmManager.character.id, ability: ability, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomAbilityScore(id: realmManager.character.id, ability: ability, increment: false)
                    }
                }
            }
            .navigationBarTitle(ability, displayMode: .inline)
        }
    }
}


