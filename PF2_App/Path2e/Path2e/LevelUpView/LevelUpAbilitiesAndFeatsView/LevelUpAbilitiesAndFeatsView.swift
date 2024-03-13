//
//  LevelUpClassAbilityView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/1/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpAbilitiesAndFeatsView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var classAbilities: Results<ClassAbility> {
        return data.classAbilities.where {
            ($0.level == realmManager.character.level) && ($0.id.in(realmManager.character.currentClass!.classAbilityIDs))
        }
    }
    var body: some View {
        List {
            Section(header: Text("Class Abilities")) {
                ForEach(classAbilities, id: \.self) { ability in
                    NavigationLink(value: Route.levelUpClassAbilitySelectionView(classAbility: ability)) {
                        HStack {
                            Text(realmManager.character.checkClassAbility(classAbility: ability) == false ? "Select Class Ability" : "Class Ability")
                            Spacer()
                            Text(realmManager.character.checkClassAbility(classAbility: ability) == false ? "Unselected" : ability.name)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            if (realmManager.character.level-1)%4 == 0 {
                Section(header: Text("Ancestry Feats")) {
                    NavigationLink(value: Route.levelUpAncestryFeatListView) {
                        HStack {
                            Text(realmManager.character.checkForAncestryFeats(levelGained: realmManager.character.level) == nil ? "Select Ancestry Feat" : "Ancestry Feat")
                            Spacer()
                            Text(realmManager.character.checkForAncestryFeats(levelGained: realmManager.character.level)?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button {
            var isSuccess = true
//            if realmManager.character.classAbilities.filter("level == %@",realmManager.character.level).filter("id == nil").count > 0 {
//                isSuccess = false
//                alertType = .chooseXClassAbilities(count: realmManager.character.classAbilities.filter("level == %@",realmManager.character.level).filter("id == nil").count)
//                showAlert = true
//            }
//            if (realmManager.character.level-1)%4 == 0 {
//                if realmManager.character.checkForAncestryFeats(levelGained: realmManager.character.level) == nil {
//                    isSuccess = false
//                    alertType = .chooseAncestryFeat
//                    showAlert = true
//                }
//            }
            
//            for ability in realmManager.character.getAllClassAbilities() {
//                print(ability.name)
//            }
//            print("Abilities with conditionals")
//            for ability in realmManager.character.returnClassAbilitiesWithConditionals() {
//                print(ability.effects?.conditionalChanges)
//            }
            if isSuccess {
                if realmManager.character.level == 1 {
                    realmManager.updateCharacterSpellLists(id: realmManager.character.id)
                    realmManager.updateCharacterFormulaList(id: realmManager.character.id)
//                    realmManager.updateCharacterLevel(id: realmManager.character.id, level: 4)
//                    appState.path.append(Route.levelUpConditionalChangeView)
                    appState.path.append(Route.levelUpLevelOneView)
                } else {
                    if realmManager.character.spellLists.count > 0 {
                        appState.path.append(Route.levelUpSpellView)
                    } else if realmManager.character.returnAlchemyProgression() {
                        appState.path.append(Route.levelUpFormulaView)
                    } else {
                        appState.popToRoot()
                    }
                }
            }
        } label: {
            Text("Next")
        }
            .alert(isPresented: $showAlert, content: {
                getAlert(myAlert: alertType)
            }))
    }
}
