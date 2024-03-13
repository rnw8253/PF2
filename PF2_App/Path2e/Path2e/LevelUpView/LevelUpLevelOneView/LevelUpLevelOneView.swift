//
//  LevelUpLevelOneView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/4/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpLevelOneView: View {
    @StateObject var chosenSkill = ChosenSkill()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    @State var languages: [String] = ["","","","",""]
    var body: some View {
        List {
            if (realmManager.character.currentClass!.additionalTrainedSkills + realmManager.character.returnAbilityScoreMod(ability: "Intelligence", excludeRoute: nil)) > 0 {
                Section(header: Text("Skills")) {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: realmManager.character.currentClass!.additionalTrainedSkills + realmManager.character.returnAbilityScoreMod(ability: "Intelligence", excludeRoute: nil), maxProfInt: 1, chosenSkill: chosenSkill)) {
                        HStack {
                            Text(chosenSkill.returnSelection() == "Unselected" ? "Select Skills" : "Skills")
                            Spacer()
                            Text(chosenSkill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            Section(header: Text("Languages")) {
                let intMod = max(realmManager.character.returnAbilityScoreMod(ability: "Intelligence", excludeRoute: nil)-1, 0)
                let knownLanguages = realmManager.character.returnKnownLanguages(excludeRoute: nil)
                ForEach(0...intMod, id: \.self) { index in
                    Picker(selection: $languages[index]) {
                        ForEach(realmManager.character.ancestry!.bonusLanguages, id: \.self) { lang in
                            if knownLanguages.contains(lang) == false {
                                Text(lang).tag(lang)
                            }
                        }
                        Text("Unselected").tag("")
                    } label: {
                        Text(languages[index] == "" ? "Select Language" : "Language")
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button {
            let intMod = max(realmManager.character.returnAbilityScoreMod(ability: "Intelligence", excludeRoute: nil)-1, 0)
            var isSuccess = true
//            if Set(languages[...intMod]).count != languages[...intMod].count {
//                isSuccess = false
//                alertType = .repeatLanguages
//                showAlert = true
//            }
//            if languages[...intMod].filter({ $0 == "" }).count > 0 {
//                isSuccess = false
//                alertType = .chooseXLanguages(count: languages[...intMod].filter({ $0 == "" }).count)
//                showAlert = true
//            }
//            if (realmManager.character.currentClass!.additionalTrainedSkills + realmManager.character.returnAbilityScoreMod(ability: "Intelligence", excludeRoute: nil)) > 0 {
//                if chosenSkill.returnSelection() == "Unselected" {
//                    isSuccess = false
//                    alertType = .chooseInitialSkills
//                    showAlert = true
//                }
//            }
            if isSuccess {
                realmManager.updateCharacterInitialLanguages(id: realmManager.character.id, languages: languages)
                realmManager.updateCharacterInitialSkills(id: realmManager.character.id, skills: chosenSkill.returnCharacterInitialSkills())
                if realmManager.character.spellLists.count > 0 {
                    appState.path.append(Route.levelUpSpellView)
                } else if realmManager.character.returnAlchemyProgression() {
                    realmManager.updateCharacterLevel(id: realmManager.character.id, level: 20)
                    appState.path.append(Route.levelUpFormulaView)
                } else {
                    appState.popToRoot()
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
