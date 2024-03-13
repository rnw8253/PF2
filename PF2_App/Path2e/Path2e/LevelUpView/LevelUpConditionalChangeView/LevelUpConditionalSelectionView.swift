//
//  LevelUpConditionalSelectionView.swift
//  Path2e
//
//  Created by Ryan Weber on 10/27/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpConditionalSelectionView: View {
    var characterCondition: CharacterConditionalChange
    var conditionalChange: ConditionalChanges
    @StateObject var chosenConditional = ChosenConditionalModel()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        let desc = realmManager.character.returnContainingDescription(conditionalChange: characterCondition)
        List {
            Group {
                // FEATS
                if conditionalChange.chooseFeat != nil {
                    NavigationLink(value: Route.chooseFeatListDisplay(selection: conditionalChange.chooseFeat!, chosenFeat: chosenConditional.feat)) {
                        HStack {
                            Text(chosenConditional.feat.feat == nil ? "Select \(conditionalChange.chooseFeat!.type) Feat" : "\(conditionalChange.chooseFeat!.type) Feat")
                                .foregroundColor(characterCondition.feat == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.feat.feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if conditionalChange.chooseFeatFromList != nil {
                    NavigationLink(value: Route.chooseFeatFromListDisplay(selection: conditionalChange.chooseFeatFromList!, chosenFeat: chosenConditional.feat)) {
                        HStack {
                            Text(conditionalChange.chooseFeatFromList!.choice)
                                .foregroundColor(chosenConditional.feat.feat == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.feat.feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                // LANGUAGE
                if conditionalChange.chooseLanguage > 0 {
                    ForEach(0...conditionalChange.chooseLanguage-1, id: \.self) { ind in
                        Picker(selection: $chosenConditional.language[ind]) {
                            ForEach(realmManager.character.returnLearnableLanguages(), id: \.self) { lang in
                                Text(lang).tag(lang)
                            }
                            Text("Unselected").tag("")
                        } label: {
                            Text(chosenConditional.language[ind] == "" ? "Select Language" : "Langauge")
                                .foregroundColor(chosenConditional.language[ind] == "" ? preferences.unselectedColor :  preferences.selectedColor)
                        }
                    }
                }
                // SKILL
                if conditionalChange.chooseLore > 0 {
                    ForEach(0...conditionalChange.chooseLore, id: \.self) { ind in
                        HStack {
                            Text(chosenConditional.lore[ind] == "" ? "Choose Lore" : "Lore")
                                .foregroundColor(chosenConditional.lore[ind] == "" ? preferences.unselectedColor :  preferences.selectedColor)
                            TextField("Type Lore Here", text: $chosenConditional.lore[ind])
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                if conditionalChange.chooseSkillFromList != nil {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: convertToStringList(names: conditionalChange.chooseSkillFromList!.skills), count: 1, maxProfInt: convertProfToInt(prof: conditionalChange.chooseSkillFromList!.prof), chosenSkill: chosenConditional.skill)) {
                        HStack {
                            Text(chosenConditional.skill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenConditional.skill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenConditional.skill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.skill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if conditionalChange.chooseSkill != nil {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: 1, maxProfInt: convertProfToInt(prof: conditionalChange.chooseSkill!), chosenSkill: chosenConditional.skill)) {
                        HStack {
                            Text(chosenConditional.skill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenConditional.skill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenConditional.skill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.skill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if conditionalChange.skillIncrease > 0 {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: conditionalChange.skillIncrease, maxProfInt: returnMaxSkillInt(level: realmManager.character.level), chosenSkill: chosenConditional.skill)) {
                        HStack {
                            Text(chosenConditional.skill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenConditional.skill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenConditional.skill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.skill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if conditionalChange.chooseSpell != nil {
                    NavigationLink(value: Route.chooseSpellListView(chooseSpell: conditionalChange.chooseSpell!, chosenSpell: chosenConditional.spell)) {
                        HStack {
                            Text(chosenConditional.spell.spell == nil ? "Select a Spell" : "Spell")
                                .foregroundColor(chosenConditional.spell.spell == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            if chosenConditional.spell.spell != nil {
                                ChosenSpellButtonDisplay(spell: chosenConditional.spell.spell!)
                            }
                            Text(chosenConditional.spell.spell?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }

            // Set Variable
            // ELSE
            // Set Variable
            Group {
                // SKILL
                if conditionalChange.elseChooseSkillFromList != nil {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: convertToStringList(names: conditionalChange.elseChooseSkillFromList!.skills), count: 1, maxProfInt: convertProfToInt(prof: conditionalChange.elseChooseSkillFromList!.prof), chosenSkill: chosenConditional.elseSkill)) {
                        HStack {
                            Text(chosenConditional.elseSkill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenConditional.elseSkill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenConditional.elseSkill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.elseSkill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if conditionalChange.elseChooseSkill != nil {
                    NavigationLink(value: Route.skillSelectionView(selectableSkills: nil, count: 1, maxProfInt: convertProfToInt(prof: conditionalChange.elseChooseSkill!), chosenSkill: chosenConditional.elseSkill)) {
                        HStack {
                            Text(chosenConditional.elseSkill.returnSelection() == "Unselected"  ? "Select Skills" : "Skills")
                                .foregroundColor(chosenConditional.elseSkill.returnSelection() == "Unselected" ? preferences.unselectedColor : chosenConditional.elseSkill.returnSelection() == "Unselected"  ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.elseSkill.returnSelection())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                // FEAT
                if conditionalChange.elseChooseFeatFromList != nil {
                    NavigationLink(value: Route.chooseFeatFromListDisplay(selection: conditionalChange.elseChooseFeatFromList!, chosenFeat: chosenConditional.elseFeat)) {
                        HStack {
                            Text(conditionalChange.chooseFeatFromList!.choice)
                                .foregroundColor(chosenConditional.elseFeat.feat == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenConditional.elseFeat.feat?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            if desc != nil {
                Text(desc!)
            }
        }
    }
}
