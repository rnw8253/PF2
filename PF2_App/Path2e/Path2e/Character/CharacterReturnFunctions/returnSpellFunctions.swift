//
//  returnSpellFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/4/23.
//

import Foundation

extension Character {

    func initializeSpellSlots(lvl: Int) {
        let effects = getEffects(lvl: lvl, excludeRoute: nil)
        for effect in effects {
            if effect.setSpellSlots != nil {
                if effect.setSpellSlots!.spellSlots != nil {
                    if effect.setSpellSlots!.spellSlots == "Single-Set" {
                        spellLists.append(CharacterSpellList(spellCastingType: effect.setSpellSlots!.castingType?.capitalized, spellSlotType: effect.setSpellSlots!.spellSlots!.capitalized, tradition: effect.setSpellSlots!.tradition?.capitalized, school: effect.setSpellSlots!.school?.capitalized, keyAbility: effect.setSpellSlots!.keyAbility, unlimitedSignatureSpells: effect.setSpellSlots!.unlimitedSignatureSpells, className: currentClass!.name))
                    } else {
                        if effect.setSpellSlots!.tradition != nil || effect.setSpellSlots!.school != nil {
                            if effect.setSpellSlots!.keyAbility != nil {
                                spellLists.append(CharacterSpellList(spellCastingType: effect.setSpellSlots!.castingType?.capitalized, spellSlotType: effect.setSpellSlots!.spellSlots!.capitalized, tradition: effect.setSpellSlots!.tradition?.capitalized, school: effect.setSpellSlots!.school?.capitalized, keyAbility: effect.setSpellSlots!.keyAbility, unlimitedSignatureSpells: effect.setSpellSlots!.unlimitedSignatureSpells, className: currentClass!.name))
                            } else {
                                for eff in effects {
                                    if eff.setSpellSlots != nil {
                                        if eff.setSpellSlots!.spellSlots == nil && eff.setSpellSlots!.keyAbility != nil && eff.spellSlot.count == 0 {
                                            spellLists.append(CharacterSpellList(spellCastingType: effect.setSpellSlots!.castingType?.capitalized, spellSlotType: effect.setSpellSlots!.spellSlots!.capitalized, tradition: effect.setSpellSlots!.tradition?.capitalized, school: effect.setSpellSlots!.school?.capitalized, keyAbility: eff.setSpellSlots!.keyAbility!, unlimitedSignatureSpells: effect.setSpellSlots!.unlimitedSignatureSpells, className: currentClass!.name))
                                        }
                                    }
                                }
                            }
                        } else {
                            for eff in effects {
                                if eff.setSpellSlots != nil {
                                    if eff.setSpellSlots!.spellSlots == nil && eff.setSpellSlots!.tradition != nil && eff.spellSlot.count == 0 {
                                        spellLists.append(CharacterSpellList(spellCastingType: effect.setSpellSlots!.castingType!.capitalized, spellSlotType: effect.setSpellSlots!.spellSlots!.capitalized, tradition: eff.setSpellSlots!.tradition?.capitalized, school: effect.setSpellSlots!.school?.capitalized, keyAbility: effect.setSpellSlots!.keyAbility, unlimitedSignatureSpells: effect.setSpellSlots!.unlimitedSignatureSpells, className: currentClass!.name))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    func hasSignatureSpells() -> Bool {
        let effects = getEffects(lvl: nil, excludeRoute: nil)
        for effect in effects {
            if effect.signatureSpells == true {
                return true
            }
        }
        return false
    }
    
    
    func returnAddSpellsToList(spellLevel: Int?) -> [SpellData] {
        let data = LoadDataModel()
        var spells: [SpellData] = []
        let effects = getEffects(lvl: nil, excludeRoute: nil)
        for effect in effects {
            if effect.spell.count > 0 {
                for sp in effect.addSpellToList {
                    if spellLevel != nil {
                        if sp.level == spellLevel {
                            spells.append(data.spells.filter("name == %@", sp.spell!)[0])
                        }
                    } else {
                        spells.append(data.spells.filter("name == %@", sp.spell!)[0])
                    }

                }
            }
        }
        return spells
    }
    func hasFocusPoint() -> Bool {
        return false
    }
}
