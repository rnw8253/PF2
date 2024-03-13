//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct ConditionalSpellDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.giveSpell != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    let sp = data.spells.filter("name == %@", conditionalChange.giveSpell!.name)[0]
                    NavigationLink(value: Route.spellView(spell: sp)) {
                        ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.giveSpell!.type)
                    }
                }
            }
            if conditionalChange.elseGiveSpell != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    let sp = data.spells.filter("name == %@", conditionalChange.giveSpell!.name)[0]
                    NavigationLink(value: Route.spellView(spell: sp)) {
                        ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.elseGiveSpell!.type)
                    }
                }
            }
            if conditionalChange.addSpellToList != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    let sp = data.spells.filter("name == %@", conditionalChange.addSpellToList!.name)[0]
                    NavigationLink(value: Route.spellView(spell: sp)) {
                        ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.addSpellToList!.type)
                    }
                }
            }
        }
    }
}

struct ConditionalGiveSpellDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.giveSpell != nil {
                let sp = data.spells.filter("name == %@", conditionalChange.giveSpell!.name)[0]
                NavigationLink(value: Route.spellView(spell: sp)) {
                    ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.giveSpell!.type)
                }
            }
            if conditionalChange.elseGiveSpell != nil {
                let sp = data.spells.filter("name == %@", conditionalChange.giveSpell!.name)[0]
                NavigationLink(value: Route.spellView(spell: sp)) {
                    ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.elseGiveSpell!.type)
                }
            }
        }
    }
}

struct ConditionalAddSpellToListDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                let sp = data.spells.filter("name == %@", conditionalChange.addSpellToList!.name)[0]
                NavigationLink(value: Route.spellView(spell: sp)) {
                    ChosenSpellButtonDisplay(spell: sp, type: conditionalChange.addSpellToList!.type)
                }
            }
        }
    }
}

//@Persisted var giveSpell: GiveSpell? = nil
//@Persisted var giveSpellSlot: SpellSlot? = nil
//@Persisted var giveFocusPoint: Bool = false
//@Persisted var addSpellToList: GiveSpell? = nil
//@Persisted var chooseSpell: ChooseSpell? = nil
//@Persisted var elseGiveSpell: GiveSpell? = nil


