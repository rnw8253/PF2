//
//  StatTabAdjustHealthView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/25/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabAdjustHealthView: View {
    @State var numberStr: String = "0"
    @EnvironmentObject var realmManager: RealmManager
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    @State var expandDisclosure: Bool = false
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                HStack {
                    Text("HP")
                        .bold()
                    VStack(spacing: 5) {
                        if realmManager.character.tempHP != 0 {
                            Text("\(realmManager.character.currentHP) / \(realmManager.character.maxHP) + \(realmManager.character.tempHP) Temporary HP")
                        } else {
                            Text("\(realmManager.character.currentHP) / \(realmManager.character.maxHP)")
                        }
                        ProgressView(value: Float(realmManager.character.currentHP), total: Float(realmManager.character.maxHP))
                            .progressViewStyle(WithBackgroundProgressViewStyle())
                    }
                }
                .buttonStyle(.plain)
                .frame(height: height)
                .padding(.horizontal)
                .background(.white)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
            }
            Button {
                realmManager.updateCharacterMaxHeal(id: realmManager.character.id)
                realmManager.updateCharacterRemoveDyingCondition(id: realmManager.character.id)
            } label: {
                Text("Heal To Max")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
            }
            CustomKeyPad(numberStr: $numberStr, keyWidth: 60)
                .frame(width: 210)
                .padding(.horizontal)
            Button {
                if realmManager.character.currentHP + Int(numberStr)! <= 0 {
                    realmManager.updateCharacterRemoveDyingCondition(id: realmManager.character.id)
                } else {
                    
                }
                realmManager.updateCharacterHP(id: realmManager.character.id, addHP: Int(numberStr)!)
                if numberStr.prefix(1) == "-" {
                    numberStr = "-0"
                } else {
                    numberStr = "0"
                }
            } label: {
                Text(numberStr.prefix(1) == "-" ? "Subtract Health" : "Add Health")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                    .shadow(radius: 10)
            }
            if numberStr.prefix(1) != "-" {
                Button {
                    realmManager.updateCharacterTempHP(id: realmManager.character.id, addHP: Int(numberStr)!)
                    numberStr = "0"
                } label: {
                    Text(numberStr.prefix(1) == "-" ? "Subtract Temporary Health" : "Add Temporary Health")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                        .shadow(radius: 10)
                }
            }
            List {
                Section(header: Text("Max Health")) {
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(String(realmManager.character.maxHP))
                    }
                    HStack {
                        Text("Ancestry Modifier")
                        Spacer()
                        Text(String(realmManager.character.ancestry?.hitPoints ?? 0))
                    }
                    HStack {
                        Text("Class Modifier ( \(realmManager.character.currentClass?.hitPoints ?? 0) x level )")
                        Spacer()
                        Text(String((realmManager.character.currentClass?.hitPoints ?? 0)*realmManager.character.level))
                    }
                    HStack {
                        Text("Constitution Modifier ( \(realmManager.character.returnAbilityScoreMod(ability: "Constitution", excludeRoute: nil)) x level )")
                        Spacer()
                        Text(String(realmManager.character.returnAbilityScoreMod(ability: "Constitution", excludeRoute: nil)*realmManager.character.level))
                    }
                    HStack {
                        Text("Bonus Modifier")
                        Spacer()
                        Text(String(realmManager.character.returnMaxHealthModificationBonus()))
                    }
                    Stepper {
                        Text(signInt(realmManager.character.maxHealthCustomScore))
                    } onIncrement: {
                        realmManager.updateCharacterIncrementCustomMaxHealth(id: realmManager.character.id, increment: true)
                    } onDecrement: {
                        realmManager.updateCharacterIncrementCustomMaxHealth(id: realmManager.character.id, increment: false)
                    }
                }
            }
            .scrollDisabled(true)
            .frame(height: 315)
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}
