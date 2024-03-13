//
//  ClassFeatureDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift

struct ClassAbilityView: View {
    let classAbility: ClassAbility
    @StateObject var chosenClassAbility = ChosenClassAbilityModel()
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        VStack {
            List {
                ClassFeatureBasicDisplays(classAbility: classAbility)
                
                if classAbility.selectType == "SELECTOR" {
                    NavigationLink(value: Route.classAbilitySelectorListView(selectorID: classAbility.id, chosenClassAbility: chosenClassAbility)) {
                        HStack {
                            Text(chosenClassAbility.classAbility == nil ? "Select Class Ability" : "Class Ability")
                                .foregroundColor(chosenClassAbility.classAbility == nil ? preferences.unselectedColor : preferences.selectedColor)
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
    }
}






