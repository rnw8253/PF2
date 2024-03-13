//
//  CharacterSpellExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 10/6/23.
//

import Foundation
import RealmSwift




class CharacterSpellList: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var spellSlotType: String
    @Persisted var spellCastingType: String?
    @Persisted var tradition: String?
    @Persisted var school: String?
    @Persisted var keyAbility: String?
    @Persisted var unlimitedSignatureSpells: Bool = false
    @Persisted var spells: RealmSwift.List<CharacterListSpell>
    @Persisted var signatureSpells: RealmSwift.List<CharacterLevelSignatureSpells>
    convenience init(spellCastingType: String?, spellSlotType: String, tradition: String?, school: String?, keyAbility: String?, unlimitedSignatureSpells: Bool, className: String) {
        self.init()
        self.spellCastingType = spellCastingType
        self.spellSlotType = spellSlotType
        self.tradition = tradition
        self.school = school
        self.keyAbility = keyAbility
        self.unlimitedSignatureSpells = unlimitedSignatureSpells
        self.spells = RealmSwift.List<CharacterListSpell>()
        var gainedSpells = [0,0,0,0,0,0,0,0,0,0]
        var newSpell = CharacterListSpell()
        var newSigSpell = CharacterLevelSignatureSpells()
        newSigSpell = CharacterLevelSignatureSpells()
        for _ in 0...10 {
            newSigSpell.spellIDs.append(0)
        }
        signatureSpells.append(newSigSpell)
        for level in 1...20 {
            if spellSlotType == "Single-Set" {
                gainedSpells = returnSingleSetNewSpellSlots(level: level)
            } else {
                switch spellCastingType {
                case "Spontaneous-Repertoire":
                    gainedSpells = returnSpontaneousNewSpellSlots(level: level, spellSlotType: spellSlotType)
                case "Prepared-Book","Prepared-Familiar":
                    gainedSpells = returnPreparedSpellCounts(name: className, level: level)
                case "Prepared-List":
                    break
                default:
                    let _ = print("Error: Cannot parse spell casting type")
                }
            }
            for spellLevel in gainedSpells.indices {
                if gainedSpells[spellLevel] > 0 {
                    for _ in 1...gainedSpells[spellLevel] {
                        newSpell = CharacterListSpell()
                        newSpell.spellLevel = spellLevel
                        newSpell.levelGained = level
                        spells.append(newSpell)
                    }
                }
            }
            newSigSpell = CharacterLevelSignatureSpells()
            for _ in 0...10 {
                newSigSpell.spellIDs.append(0)
            }
            signatureSpells.append(newSigSpell)
        }
    }
    func returnSpellIDs() -> [Int] {
        var ids: [Int] = []
        for spell in spells {
            if spell.id != 0 {
                ids.append(spell.id)
            }
        }
        return ids
    }
    func returnSpellIDsLevel(level: Int) -> [Int] {
        var ids: [Int] = []
        for spell in spells.filter("spellLevel == %@", level) {
            if spell.id != 0 {
                ids.append(spell.id)
            }
        }
        return ids
    }
    func returnSignatureSpell(level: Int, spellLevel: Int) -> SpellData? {
        let data = LoadDataModel()
        if signatureSpells[level].spellIDs[spellLevel] != 0 {
            return data.spells.filter("id == %@", signatureSpells[level].spellIDs[spellLevel])[0]
        } else {
            return nil
        }
    }
}

class CharacterListSpell: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var spellLevel: Int
    @Persisted var levelGained: Int
}


class CharacterLevelSignatureSpells: Object, ObjectKeyIdentifiable {
    @Persisted var spellIDs = RealmSwift.List<Int>()
}

