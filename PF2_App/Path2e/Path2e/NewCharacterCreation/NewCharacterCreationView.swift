//
//  NewCharacterCreationView.swift
//  Path2e
//
//  Created by Ryan Weber on 7/29/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct NewCharacterCreationView: View {
    var characterID: ObjectId
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var realmManager: RealmManager
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    @State var showingDeleteAlert: Bool = false
    @State var name: String = ""
    let realm = try! Realm()
    var body: some View {
        List {
            Section(header: Text("Character")) {
                HStack{
                    Text(name == "" ? "Select Name" : "Name")
//                        .foregroundColor(name == "" ? preferences.unselectedColor : preferences.selectedColor)
                        .frame(height: 50)
                    TextField("Character's Name", text: $name)
                        .multilineTextAlignment(.trailing)
                }
            }
            Section(header: Text("Class")){
                NavigationLink(value: Route.classSelectionListDisplay) {
                    HStack{
                        Text(realmManager.character.currentClass == nil ? "Select Class" : "Class")
//                            .foregroundColor(realmManager.character.currentClass == nil ? preferences.unselectedColor : preferences.selectedColor)
                        Spacer()
                        if realmManager.character.currentClass != nil {
                            Image(realmManager.character.currentClass!.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        Text(realmManager.character.currentClass?.name ?? "Unselected")
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 50)
                }
            }
            Section(header: Text("Ancestry")) {
                NavigationLink(value: Route.ancestrySelectionListDisplay) {
                    HStack{
                        Text(realmManager.character.ancestry == nil ? "Select Ancestry" : "Ancestry")
//                            .foregroundColor(realmManager.character.ancestry == nil ? preferences.unselectedColor : preferences.selectedColor)
                        Spacer()
                        if realmManager.character.ancestry != nil {
                            Image(realmManager.character.ancestry!.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        }
                        Text(realmManager.character.ancestry?.name ?? "Unselected")
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 50)
                }
            }
            if realmManager.character.ancestry != nil {
                Section(header: Text("Heritage")) {
                    NavigationLink(value: Route.heritageSelectionListDisplay) {
                        HStack{
                            Text(realmManager.character.heritage == nil ? (realmManager.character.versatileHeritage == nil ? "Select Heritage" : "Heritage") : "Heritage")
//                                .foregroundColor(realmManager.character.heritage == nil ? (realmManager.character.versatileHeritage == nil ? preferences.unselectedColor : preferences.selectedColor) : preferences.selectedColor)
                            Spacer()
                            if realmManager.character.heritage != nil {
                                Image(realmManager.character.heritage!.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text(realmManager.character.heritage!.name)
                                    .foregroundColor(.secondary)
                            } else if realmManager.character.versatileHeritage != nil {
                                Image(realmManager.character.versatileHeritage!.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                Text(realmManager.character.versatileHeritage!.name)
                                    .foregroundColor(.secondary)
                            } else {
                                Text("Unselected")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(height: 50)
                    }
                }
            }
            Section(header: Text("Background")) {
                NavigationLink(value: Route.backgroundSelectionListDisplay) {
                    HStack{
                        Text(realmManager.character.background == nil ? "Select Background" : "Background")
//                            .foregroundColor(realmManager.character.background == nil ? preferences.unselectedColor : preferences.selectedColor)
                        Spacer()
                        if realmManager.character.background != nil {
                            Image("BackgroundMarker")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( width: 50, height: 50)
                        }
                        Text(realmManager.character.background?.name ?? "Unselected")
                            .foregroundColor(.secondary)
                    }
                    .frame(height: 50)
                }
            }
            Section(header: Text("Alignment")) {
                NavigationLink(value: Route.alignmentSelectionView) {
                    HStack{
                        Text(realmManager.character.alignment == "" ? "Select Alignment" : "Alignment")
//                            .foregroundColor(realmManager.character.alignment == "" ? preferences.unselectedColor : preferences.selectedColor)
                        Spacer()
                        Text(realmManager.character.alignment)
                            .foregroundColor(.secondary)
                        Image(systemName: realmManager.character.alignmentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(realmManager.character.alignmentColor))
                    }
                }
            }
        }

//        .listStyle(GroupedListStyle())
        .navigationBarTitle("Character Creation", displayMode: .inline)
        .padding(.bottom)
        .navigationBarItems(
            leading:
                Button {
                    showingDeleteAlert = true
                } label: {
                    Text("Cancel")
                }
                .alert(isPresented:$showingDeleteAlert) {
                    Alert(
                        title: Text("Delete Character"),
                        message: Text("Are you sure?"),
                        primaryButton: .destructive(Text("Delete")) {
                            appState.popToRoot()
                            realmManager.deleteCharacter(id: characterID)
                        },
                        secondaryButton: .cancel()
                    )
                }
        )
        .navigationBarItems(trailing: Button {
//            var isSuccess = true
//            if character.character.background == nil {
//                isSuccess = false
//                alertType = .chooseBackground
//                showAlert = true
//            }
//            if character.character.heritage == nil && character.character.versatileHeritage == nil {
//                isSuccess = false
//                alertType = .chooseHeritage
//                showAlert = true
//            }
//            if character.character.ancestry == nil {
//                isSuccess = false
//                alertType = .chooseAncestry
//                showAlert = true
//            }
//            if character.character.currentClass == nil {
//                isSuccess = false
//                alertType = .chooseClass
//                showAlert = true
//            }
//            if character.name == "" {
//                isSuccess = false
//                alertType = .chooseCharactersName
//                showAlert = true
//            }
//            if isSuccess == true {
            realmManager.updateCharacterName(id: characterID, name: name)
//            for cAbility in LoadDataModel().classAbilities {
//                if cAbility.effects != nil {
//                    if cAbility.effects!.conditionalChange.count > 0 {
//                        for conditionalChange in cAbility.effects!.conditionalChange {
//                            if checkConditionForChoice(conditionalChange: conditionalChange) {
//                                print(cAbility.name)
//                            }
//                        }
//                    }
//                }
//            }
            appState.path.append(Route.levelUpAbilitiesAndFeatsView)
//            appState.popToRoot()
            //            }
        } label: {
            Text("Next")
        }
            .alert(isPresented: $showAlert, content: {
                getAlert(myAlert: alertType)
            }))
    }
}


