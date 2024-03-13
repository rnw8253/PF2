
import Foundation
import SwiftUI
import RealmSwift

struct SkillDisplay: View {
    var skills: Skill
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        if skills.addLevelToUntrainedSkills == true || skills.chooseFromList.count > 0 || skills.choose.count > 0 || skills.giveSkillIncrease > 0 || skills.chooseLore > 0 || skills.chooseLoreIncreasing > 0 || skills.skillProficiencies.count > 0 {
            Section(header: Text("Skills")) {
                if skills.addLevelToUntrainedSkills == true {
                    Text("Give Level to Untrained Weapon Proficiencies")
                }
                if skills.chooseFromList.count > 0 {
                    ForEach(Array(skills.chooseFromList.enumerated()), id: \.element) { index, skill in
                        NavigationLink(value: Route.skillSelectionView(selectableSkills: convertToStringList(names: skill.skills), count: 1, maxProfInt: convertProfToInt(prof: skill.prof), chosenSkill: chosenFeatures.chooseSkillFromList[index])) {
                            HStack {
                                Text(chosenFeatures.chooseSkillFromList[index].returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                    .foregroundColor(chosenFeatures.chooseSkillFromList[index].returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                Text(chosenFeatures.chooseSkillFromList[index].returnSelection())
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if skills.choose.count > 0 {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: skills.choose.count, maxProfInt: convertProfToInt(prof: skills.choose[0]), chosenSkill: chosenFeatures.chooseSkill)) {
                        HStack {
                            Text(chosenFeatures.chooseSkill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenFeatures.chooseSkill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenFeatures.chooseSkill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.chooseSkill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if skills.giveSkillIncrease != 0 {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: skills.giveSkillIncrease, maxProfInt: returnMaxSkillInt(level: realmManager.character.level), chosenSkill: chosenFeatures.skillIncrease)) {
                        HStack {
                            Text(chosenFeatures.skillIncrease.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenFeatures.skillIncrease.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenFeatures.skillIncrease.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.skillIncrease.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if skills.chooseLore > 0 {
                    ForEach(0...skills.chooseLore, id: \.self) { ind in
                        HStack {
                            Text(chosenFeatures.chooseLore[ind] == "" ? "Choose Lore" : "Lore")
                                .foregroundColor(chosenFeatures.chooseLore[ind] == "" ? preferences.unselectedColor :  preferences.selectedColor)
                            TextField("Type Lore Here", text: $chosenFeatures.chooseLore[ind])
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                if skills.chooseLoreIncreasing > 0 {
                    ForEach(0...skills.chooseLoreIncreasing, id: \.self) { ind in
                        HStack {
                            Text(chosenFeatures.chooseLoreIncreasing[ind] == "" ? "Choose Lore" : "Lore")
                                .foregroundColor(chosenFeatures.chooseLoreIncreasing[ind] == "" ? preferences.unselectedColor :  preferences.selectedColor)
                            TextField("Type Lore Here", text: $chosenFeatures.chooseLoreIncreasing[ind])
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                if skills.skillProficiencies.count > 0 {
                    ForEach(skills.skillProficiencies.indices, id: \.self) { ind in
                        if chooseNewProf(realmManager.character.returnSkillProficiency(skill: skills.skillProficiencies[ind].name!, excludeRoute: appState.path), convertProf(skills.skillProficiencies[ind].prof)) {
                            NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: 1, maxProfInt: 1, chosenSkill: chosenFeatures.skillProficiency[ind])) {
                                HStack {
                                    Text(chosenFeatures.skillProficiency[ind].returnSelection() == "Unselected" ? "Select a Replacement Skill" : "Replacement Skill")
                                        .foregroundColor(chosenFeatures.skillProficiency[ind].returnSelection() == "Unselected" ? preferences.unselectedColor :  preferences.selectedColor)
                                    Spacer()
                                    
                                    Text(chosenFeatures.skillProficiency[ind].returnSelection())
                                        .foregroundColor(.secondary)
                                }
                            }
                        } else {
                            HStack {
                                Text("\(skills.skillProficiencies[ind].name!) Skill Proficiency")
                                Spacer()
                                Text(convertProf(skills.skillProficiencies[ind].prof))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }
}
