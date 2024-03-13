//
//  StatTabHealth.swift
//  Path2e
//
//  Created by Ryan Weber on 11/25/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabHealthDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                NavigationLink(value: Route.statTabAdjustHealthView) {
                    HStack {
                        Text("HP")
                            .bold()
                        VStack(spacing: 5) {
                            Text("\(realmManager.character.currentHP) / \(realmManager.character.maxHP)")
                            ProgressView(value: Float(realmManager.character.currentHP), total: Float(realmManager.character.maxHP))
                                .progressViewStyle(WithBackgroundProgressViewStyle())
                        }
                    }
                }
                .buttonStyle(.plain)
                .frame(height: height)
                .padding(.horizontal)
                .background(.white)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
                if realmManager.character.currentHP == 0 {
                    HStack {
                        Stepper {
                            NavigationLink(value: Route.statTabDyingView) {
                                HStack {
                                    Text("Dying Condition")
                                    Spacer()
                                    Text("\(realmManager.character.returnConditionValue(condition: "Dying"))")
                                }
                            }
                            .buttonStyle(.plain)
                        } onIncrement: {
                            realmManager.updateCharacterIncrementDyingCondition(id: realmManager.character.id, increment: true)
                        } onDecrement: {
                            realmManager.updateCharacterIncrementDyingCondition(id: realmManager.character.id, increment: false)
                        }
                    }
                    .frame(height: height)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
                

                    NavigationLink(value: Route.featView(feat: data.feats.filter("name == 'Recovery Check'")[0])) {
                        HStack {
                            Text("Recovery Check DC")
                            Spacer()
                            Text(String(realmManager.character.returnRecoveryCheckDC()))
                        }
                        .frame(height: height)
                        .padding(.horizontal)
                        .background(.white)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
                    }
                    .buttonStyle(.plain)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Hit Points")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
