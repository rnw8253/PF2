//
//  ClassFeatureDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift


struct ClassFeatureSelectionDisplay: View {
    let classAbility: ClassAbility
    @ObservedObject var chosenFeature: ChosenFeaturesModel
    let index: Int
    let screenPop: Int
    @StateObject var chosenClassAbility = ChosenClassAbilityModel()
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                ClassFeatureBasicDisplays(classAbility: classAbility)
                
                if classAbility.selectType == "SELECTOR" {
                    NavigationLink(value: Route.classAbilitySelectorListView(selectorID: classAbility.id, chosenClassAbility: chosenClassAbility)) {
                        HStack {
                            Text("Class Ability")
                            Spacer()
                            Text(chosenClassAbility.classAbility?.name ?? "Unselected")
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
                chosenFeature.classAbilityFeatures[index] = chosenClassAbility
                appState.popXViews(screenPop)
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






