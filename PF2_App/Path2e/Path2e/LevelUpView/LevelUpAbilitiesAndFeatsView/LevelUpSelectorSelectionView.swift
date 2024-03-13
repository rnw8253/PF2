//
//  ClassFeatureDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift


struct LevelUpSelectorSelectionView: View {
    let classAbility: ClassAbility
    @ObservedObject var selectorClassAbility: ChosenClassAbilityModel
    @StateObject var chosenClassAbility = ChosenClassAbilityModel()
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                ClassFeatureBasicDisplays(classAbility: classAbility)
                if classAbility.selectType == "SELECTOR" {
                    NavigationLink(value: Route.levelUpSelectorListView(selectorID: classAbility.id, selectorClassAbility: chosenClassAbility)) {
                        HStack {
                            Text(chosenClassAbility.selectorAbility?.classAbility == nil ? "Select Class Ability" : "Class Ability")
                                .foregroundColor(chosenClassAbility.selectorAbility?.classAbility == nil ? preferences.unselectedColor : preferences.selectedColor)
                            Spacer()
                            Text(chosenClassAbility.selectorAbility?.classAbility?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if classAbility.effects != nil {
                    EffectDisplay(effects: classAbility.effects!, chosenFeatures: chosenClassAbility.classAbilityFeatures)
                }
                ClassFeatureDescriptionDisplays(classAbility: classAbility)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(classAbility.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenClassAbility.classAbilityFeatures)
            if alertType == nil {
                chosenClassAbility.classAbility = classAbility
                selectorClassAbility.selectorAbility = chosenClassAbility
                appState.popXViews(2)
            }
        } label: {
            Text("Choose Class Ability")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Capsule())
        }
    }
}






