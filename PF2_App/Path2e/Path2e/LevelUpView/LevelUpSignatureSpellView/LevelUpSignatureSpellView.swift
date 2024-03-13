//
//  LevelUpLevelOneView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/4/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct LevelUpSignatureSpellView: View {
    @StateObject var levelUpModel = LevelUpCharacterModel()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        let signatureSpellLevel = returnSignatureSpellLevel(level: realmManager.character.level)
        List {
            ForEach(realmManager.character.spellLists, id: \.self) { spellList in
                if signatureSpellLevel != nil {
                    if spellList.spellCastingType != nil {
                        if spellList.spellCastingType!.capitalized == "Spontaneous-Repertoire" {
                            Section(header: Text("New Signature Spell")) {
                                ForEach(signatureSpellLevel!, id: \.self) { spellLevel in
                                    NavigationLink(value: Route.levelUpSignatureSpellListView(spellList: spellList, spellLevel: spellLevel)) {
                                        SignatureSpellSelectedButtonDisplay(spellList: spellList, spellLevel: spellLevel)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ForEach(realmManager.character.spellLists, id: \.self) { spellList in
                if spellList.spellCastingType!.capitalized == "Spontaneous-Repertoire" {
                    Section(header: Text("Exchange Signature Spell")) {
                        if returnReplaceSignatureSpellLevel(level: realmManager.character.level) > 0 {
                            ForEach(1...returnReplaceSignatureSpellLevel(level: realmManager.character.level), id: \.self) { spellLevel in
                                NavigationLink(value: Route.levelUpSignatureSpellListView(spellList: spellList, spellLevel: spellLevel)) {
                                    HStack {
                                        SignatureSpellSelectedButtonDisplay(spellList: spellList, spellLevel: spellLevel)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button {
            var isSuccess = true
            let signatureSpellLevel = returnSignatureSpellLevel(level: realmManager.character.level)
            for spellList in realmManager.character.spellLists {
                if signatureSpellLevel != nil {
                    if spellList.spellCastingType != nil {
                        if spellList.spellCastingType!.capitalized == "Spontaneous-Repertoire" {
                            for spellLevel in signatureSpellLevel! {
                                if spellList.signatureSpells[realmManager.character.level].spellIDs[spellLevel] == 0 {
                                    isSuccess = false
                                    alertType = .chooseSignatureSpell
                                    showAlert = true
                                }
                            }
                        }
                    }
                }
            }
            if isSuccess {
                if realmManager.character.returnAlchemyProgression() {
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

struct SignatureSpellSelectedButtonDisplay: View {
    var spellList: CharacterSpellList
    var spellLevel: Int
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        HStack {
            HStack {
            
                let spell = spellList.returnSignatureSpell(level: realmManager.character.level, spellLevel: spellLevel)
                if spell != nil {
                    if spell!.traitIDs.contains(1) {
                        Image("Abjuration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(228) {
                        Image("Divination")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(182) {
                        Image("Transmutation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(122) {
                        Image("Necromancy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(120) {
                        Image("Illusion")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(231) {
                        Image("Evocation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(130) {
                        Image("Enchantment")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(39) {
                        Image("Conjuration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if spell!.traitIDs.contains(where: [254,183,252,6093,324,6097].contains) {
                        Image("Elemental")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                Text(spell == nil ? "Select level \(spellLevel)" : "level \(spellLevel)")
                Spacer()
                Text(spell?.name ?? "Unselected")
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 30)
    }
}
