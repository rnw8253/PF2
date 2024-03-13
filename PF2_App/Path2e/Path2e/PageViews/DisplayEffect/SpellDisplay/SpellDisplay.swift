//
//  SpellDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SpellDisplay: View {
    var spells: Spell
//    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        if spells.giveSpell.count > 0 || spells.addSpellToList.count > 0 || spells.giveFocusPoint == true || spells.setSpellSlots != nil  || spells.giveSpell.count > 0 || spells.setSpellKeyAbility != nil || spells.setSpellCastingType != nil || spells.setSpellTradition != nil || spells.signatureSpells == true || spells.unlimitedSignatureSpells == true || spells.chooseSpellFromList.count > 0 || spells.giveSpellSlot.count > 0 || spells.chooseSpell.count > 0 || spells.chooseSchoolSpell != nil || spells.spellProficiencies.count > 0 {
            Section(header: Text("Spells")) {
                ForEach(spells.giveSpell, id: \.self) { spell in
                    let sp = data.spells.filter("name == %@", spell.name)[0]
                    NavigationLink(value: Route.spellView(spell: sp)) {
                        ChosenSpellButtonDisplay(spell: sp, type: spell.type)
                    }
                }
                if spells.addSpellToList.count > 0 {
                    ForEach(spells.addSpellToList, id: \.self) { spell in
                        let sp = data.spells.filter("name == %@", spell.name)[0]
                        NavigationLink(value: Route.spellView(spell: sp)) {
                            ChosenSpellButtonDisplay(spell: sp, type: spell.type)
                        }
                    }
                }
                Group {
                    if spells.giveFocusPoint == true {
                        HStack {
                            Text("Gain a Focus Point")
                            Spacer()
                        }
                    }
                    if spells.setSpellSlots != nil {
                        HStack {
                            Text("Set Spell Slots")
                            Spacer()
                            Text(spells.setSpellSlots!.capitalized)
                                .foregroundColor(.secondary)
                        }
                    }
                    if spells.setSpellKeyAbility != nil {
                        HStack {
                            Text("Set Spell Key Ability")
                            Spacer()
                            Text(convertAbility(spells.setSpellKeyAbility!.capitalized))
                                .foregroundColor(.secondary)
                        }
                    }
                    if spells.setSpellCastingType != nil {
                        HStack {
                            Text("Set Spell Casting Type")
                            Spacer()
                            Text(spells.setSpellCastingType!.capitalized)
                                .foregroundColor(.secondary)
                        }
                    }
                    if spells.setSpellTradition != nil {
                        HStack {
                            Text("Set Spell Tradition")
                            Spacer()
                            Text(spells.setSpellTradition!.capitalized)
                                .foregroundColor(.secondary)
                        }
                    }
                    if spells.signatureSpells == true {
                        HStack {
                            Text("Gain Signature Spells")
                            Spacer()
                        }
                    }
                    if spells.unlimitedSignatureSpells == true {
                        HStack {
                            Text("Gain Unlimited Signature Spells")
                            Spacer()
                        }
                    }
                }
                if spells.chooseSpellFromList.count > 0 {
                    ForEach(Array(spells.chooseSpellFromList.enumerated()), id: \.element) { index, spell in
                        NavigationLink(value: Route.chooseSpellFromListView(selection: spell, chosenSpell: chosenFeatures.chooseSpellFromList[index])) {
                            HStack {
                                Text(chosenFeatures.chooseSpellFromList[index].spell == nil ? "Select a Spell" : "Spell")
                                    .foregroundColor(chosenFeatures.chooseSpellFromList[index].spell == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                if chosenFeatures.chooseSpellFromList[index].spell != nil {
                                    ChosenSpellButtonDisplay(spell: chosenFeatures.chooseSpellFromList[index].spell!)
                                }
                                Text(chosenFeatures.chooseSpellFromList[index].spell?.name ?? "Unselected")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if spells.giveSpellSlot.count > 0 {
                    ForEach(spells.giveSpellSlot, id: \.self) { spell in
                        HStack {
                            Text("Give \(spell.type) Spell Slot")
                            Spacer()
                            Text("level \(spell.level)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if spells.chooseSpell.count > 0 {
                    ForEach(Array(spells.chooseSpell.enumerated()), id: \.element) { index, spell in
                        NavigationLink(value: Route.chooseSpellListView(chooseSpell: spell, chosenSpell: chosenFeatures.chooseSpells[index])) {
                            HStack {
                                Text(chosenFeatures.chooseSpells[index].spell == nil ? "Select a Spell" : "Spell")
                                    .foregroundColor(chosenFeatures.chooseSpells[index].spell == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                if chosenFeatures.chooseSpells[index].spell != nil {
                                    ChosenSpellButtonDisplay(spell: chosenFeatures.chooseSpells[index].spell!)
                                }
                                Text(chosenFeatures.chooseSpells[index].spell?.name ?? "Unselected")
                                    .foregroundColor(.secondary)
                            }
                            .frame(height: 30)
                        }
                    }
                }
                if spells.spellProficiencies.count > 0 {
                    ForEach(spells.spellProficiencies, id: \.self) { prof in
                        HStack {
                            switch prof.type {
                            case "Spell Attack":
                                Text("\(prof.name!) Spell Attack Proficiency")
                            case "Spell DC":
                                Text("\(prof.name!) Spell DC Proficiency")
                            default:
                                let _ = print("ERROR: Couldn't identify proficiency")
                                let _ = print(prof)
                            }
                            Spacer()
                            Text(convertProf(prof.prof))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}






