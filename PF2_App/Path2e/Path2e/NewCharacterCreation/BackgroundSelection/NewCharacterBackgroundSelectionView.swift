//
//  BackgroundStatView.swift
//  PF2
//
//  Created by Ryan Weber on 1/17/22.
//

import SwiftUI
import RealmSwift

struct NewCharacterBackgroundSelectionView: View {
    // Variables to read in
    let background: BackgroundData
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    @StateObject var chosenBackground = ChosenBackgroundModel()
    @EnvironmentObject var appState: AppState
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                
                Section(header: Text("Source")) {
                    Text(background.contentSrc)
                }
                NavigationLink(value: Route.abilityBoostSelectionView(count: background.boosts.count, options: background.boosts[0], boosts: nil, flaw: nil, chosenAbilityBoosts: chosenBackground.abilityBoost)) {
                    HStack {
                        Text(chosenBackground.abilityBoost.returnAbilityBoosts() == "Unselected" ? "Select Ability Boosts" : "Ability Boosts")
                            .foregroundColor(chosenBackground.abilityBoost.returnAbilityBoosts() == "Unselected" ? preferences.unselectedColor : preferences.selectedColor)
                        Spacer()
                        Text(chosenBackground.abilityBoost.returnAbilityBoosts())
                            .foregroundColor(.secondary)
                    }
                }

                if background.effects != nil {
                    EffectDisplay(effects: background.effects!, chosenFeatures: chosenBackground.backgroundFeatures)
                }
                

                Section(header: Text("Description")) {
                    Text(background.descriptions)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(background.name, displayMode: .inline)
            .padding(.bottom)
            Button {
                (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenBackground.backgroundFeatures)
                if alertType == nil {
                    chosenBackground.background = background
                    realmManager.updateCharacterBackground(id: realmManager.character.id, background: chosenBackground.returnCharacterBackground(levelGained: 1))
                    appState.popXViews(2)
                }
            } label: {
                Text("Choose Background")
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
    }
}
