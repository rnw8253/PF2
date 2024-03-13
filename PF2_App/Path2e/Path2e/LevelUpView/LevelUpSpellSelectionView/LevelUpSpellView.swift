//
//  LevelUpChooseSpells.swift
//  Path2e
//
//  Created by Ryan Weber on 8/1/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpSpellView: View {
    @StateObject var levelUpModel = LevelUpCharacterModel()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        List {
            ForEach(realmManager.character.spellLists, id: \.self) { spellList in
                switch spellList.spellCastingType {
                case "Spontaneous-Repertoire","Prepared-Book","Prepared-Familiar",nil:
                    Section(header: spellList.tradition != nil ? Text("\(spellList.tradition!) Spells") : Text("\(spellList.school!) Spells")) {
                        ForEach(spellList.spells.filter("levelGained == %@", realmManager.character.level), id: \.self) { spell in
                            NavigationLink(value: Route.levelUpSpellListView(spellList: spellList, listSpell: spell)) {
                                if spellList.tradition != nil {
                                    SpellSelectedButtonDisplay(listSpell: spell)
                                } else {
                                    SchoolSpellSelectedButtonDisplay(listSpell: spell, school: spellList.school!)
                                }
                            }
                        }
                    }
                case "Prepared-List":
                    Section(header: Text("\(spellList.tradition!) Spells")) {
                        ForEach(0...returnMaxSpellLevel(level: realmManager.character.level), id: \.self) { spellLevel in
                            NavigationLink(value: Route.levelUpPreparedListListView(spellList: spellList, spellLevel: spellLevel)) {
                                HStack {
                                    if spellLevel == 0 {
                                        Text("Cantrip \(spellList.tradition!) Spells")
                                    } else {
                                        Text("level \(spellLevel) \(spellList.tradition!) Spells")
                                    }
                                        Spacer()
                                }
                            }
                        }
                    }
                default:
                    let _ = print("Error: Cannot parse spell casting type")
                }
            }
        }
        .navigationBarItems(trailing: Button {
            var isSuccess = true
//            for spellList in realmManager.character.spellLists {
//                switch spellList.spellCastingType {
//                case "Spontaneous-Repertoire","Prepared-Book","Prepared-Familiar",nil:
//                    for spell in spellList.spells.filter("levelGained == %@", realmManager.character.level) {
//                        if spell.id == 0 {
//                            isSuccess = false
//                            alertType = .chooseSpells
//                            showAlert = true
//                        }
//                    }
//                case "Prepared-List":
//                    break
//                default:
//                    let _ = print("Error: Cannot parse spell casting type")
//                }
//            }
            if isSuccess {
                if realmManager.character.hasSignatureSpells() {
                    appState.path.append(Route.levelUpSignatureSpellView)
                } else if realmManager.character.returnAlchemyProgression() {
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


struct SpellSelectedButtonDisplay: View {
    var listSpell: CharacterListSpell
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var loadDataModel: LoadDataModel
    var body: some View {
        HStack {
            HStack {
                if listSpell.id != 0 {
                    let spell = loadDataModel.spells.filter("id == %@", listSpell.id)[0]
                    if spell.traitIDs.contains(1) {
                        Image("Abjuration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(228) {
                        Image("Divination")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(182) {
                        Image("Transmutation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(122) {
                        Image("Necromancy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(120) {
                        Image("Illusion")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(231) {
                        Image("Evocation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(130) {
                        Image("Enchantment")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(39) {
                        Image("Conjuration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell.traitIDs.contains(where: [254,183,252,6093,324,6097].contains) {
                        Image("Elemental")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                if listSpell.spellLevel == 0 {
                    Text("Cantrip")
                } else {
                    Text("level: \(listSpell.spellLevel)")
                }
                Spacer()
                Text(listSpell.name == "" ? "Unselected" : listSpell.name)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 30)
    }
}

struct SchoolSpellSelectedButtonDisplay: View {
    var listSpell: CharacterListSpell
    var school: String
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var loadDataModel: LoadDataModel
    var body: some View {
        HStack {
            Image(school)
                .resizable()
                .aspectRatio(contentMode: .fit)
            if listSpell.spellLevel == 0 {
                Text("Cantrip")
            } else {
                Text("level: \(listSpell.spellLevel)")
            }
            Spacer()
            Text(listSpell.name == "" ? "Unselected" : listSpell.name)
                .foregroundColor(.secondary)
        }
        .frame(height: 30)
    }
}

