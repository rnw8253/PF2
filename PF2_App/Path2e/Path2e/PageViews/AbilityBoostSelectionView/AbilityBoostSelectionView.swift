//
//  AbilityBoostSelectionDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct AbilityBoostSelectionView: View {
    var count: Int
    var options: Boosts?
    var boosts: [String]?
    var flaw: String?
    @StateObject var abilities = AbilitiesTracker()
    @ObservedObject var chosenAbilityBoosts: ChosenAbilityBoostModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var totalCount: Int {
        var count = 0
        for ability in abilities.abilities {
            if ability.isPicked {
                count += 1
            }
        }
        return count
    }
    var choicesLeft: Int {
        return count - totalCount
    }
    var firstChoicePicked: Bool {
        if options == nil {
            return true
        } else {
            for ability in abilities.abilities {
                if ability.isFirstOption && ability.isPicked {
                    return true
                }
            }
            return false
        }
    }
    var body: some View {
        VStack {
            Text("Choose \(choicesLeft) Ability Score Increases")
            List {
                ForEach(abilities.abilities.indices, id: \.self) { index in
                    SingleAbilityDisplay(tracker: $abilities.abilities[index], choicesLeft: choicesLeft, firstChoicePicked: firstChoicePicked)
                }
            }
            .listStyle(.grouped)
            Button {
                if choicesLeft == 0 {
                    chosenAbilityBoosts.abilityBoosts = []
                    for ability in abilities.abilities {
                        if ability.isPicked {
                            chosenAbilityBoosts.abilityBoosts.append(ability.ability)
                        }
                    }
                    appState.popXViews(1)
                } else {
                    alertType = .chooseXAbilityBoosts(count: choicesLeft)
                    showAlert = true
                }

            } label: {
                Text("Choose Ability Scores")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Capsule())
            }
            .alert(isPresented: $showAlert, content: {
                getAlert(myAlert: alertType)
            })
        }
        .onAppear {
            abilities.initiate(options: options, boosts: boosts, flaw: flaw, character: realmManager.character, excludeRoute: appState.path)
        }
    }
}

