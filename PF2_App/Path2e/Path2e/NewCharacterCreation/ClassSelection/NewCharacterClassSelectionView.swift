//
//  ClassStatView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift
import SwiftUI

struct NewCharacterClassSelectionView: View {
    var currentClass: ClassData
    @StateObject var chosenClass = ChosenClassModel()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                Section(header: Text("Basic Info")) {
                    HStack {
                        Text("Source")
                        Spacer()
                        Text(currentClass.contentSrc)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Hit Points")
                        Spacer()
                        Text(String(currentClass.hitPoints))
                            .foregroundColor(.secondary)
                    }
                    if currentClass.keyAbility.count > 1 {
                        Picker(selection: $chosenClass.keyAbility) {
                            ForEach(currentClass.keyAbility, id: \.self) { ability in
                                Text(ability).tag(ability)
                            }
                            Text("Unselected").tag("")
                        } label: {
                            Text(chosenClass.keyAbility == "" ? "Select Ability Boost" : "Ability Boost")
                                .foregroundColor(chosenClass.keyAbility == "" ? preferences.unselectedColor :  preferences.selectedColor)
                        }
                    } else {
                        if currentClass.keyAbility[0] != "OTHER" {
                            HStack {
                                Text("Key Ability")
                                Spacer()
                                Text(currentClass.keyAbility[0])
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    let trait = data.traits.filter("id == %@",currentClass.tagID)[0]
                    NavigationLink(value: Route.traitView(trait: trait)) {
                        HStack {
                            Text("Trait")
                            Spacer()
                            Text(trait.name)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section(header: Text("Perception")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Perception" {
                            HStack {
                                Text("Perception")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Section(header: Text("Saves")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Save" {
                            HStack {
                                Text("\(prof.name!) Save")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Section(header: Text("Weapons")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Weapon Category" {
                            HStack {
                                Text("\(prof.name!) Weapon Category")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Section(header: Text("Armor")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Armor Category" {
                            HStack {
                                Text("\(prof.name!) Armor Category")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Section(header: Text("Skills")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Skill" {
                            HStack {
                                Text("\(prof.name!) Skill")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    HStack {
                        Text("Additional Skills")
                        Spacer()
                        Text(String(currentClass.additionalTrainedSkills))
                            .foregroundColor(.secondary)
                    }
                }
                
                Section(header: Text("Class DC")) {
                    ForEach(currentClass.classProfs, id: \.self) { prof in
                        if prof.type == "Class DC" {
                            HStack {
                                Text("Class DC")
                                Spacer()
                                Text(convertProf(prof.prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                if currentClass.effects != nil {
                    EffectDisplay(effects: currentClass.effects!, chosenFeatures: chosenClass.chosenFeatures)
                }
                NavigationLink(value: Route.classAbilityListDisplay(currentClass: currentClass)) {
                    HStack {
                        Text("Class Abilities")
                    }
                }
                Section(header: Text("Description")) {
                    Image(currentClass.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    Text(currentClass.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(currentClass.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenClass.chosenFeatures)
            if alertType == nil {
                chosenClass.className = currentClass
                realmManager.updateCharacterClass(id: realmManager.character.id, currentClass: chosenClass.returnCharacterClass(levelGained: 1))
                appState.popXViews(2)
            }
        } label: {
            Text("Choose Class")
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

