//
//  NewCharacterRealmManager.swift
//  Path2e
//
//  Created by Ryan Weber on 9/29/23.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var characters: [Character] = []
    @Published private(set) var character: Character = Character()
    
    init() {
        openRealm()
        getCharacters()
    }
    
    func openRealm() {
        do {
            var config = Realm.Configuration(schemaVersion: 1)
            config.deleteRealmIfMigrationNeeded = true
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addCharacter() -> ObjectId? {
        var id: ObjectId? = nil
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newCharacter = Character()
                    getCharacters()
                    localRealm.add(newCharacter)
                    id = newCharacter.id
                }
            } catch {
                print("Error adding character to Realm: \(error)")
            }
        }
        return id
    }
    
    func getCharacter(id: ObjectId) {
        if let localRealm = localRealm {
            let newCharacter = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
            guard !newCharacter.isEmpty else { return }
            character = newCharacter[0]
        }
    }
    
    func getCharacters() {
        if let localRealm = localRealm {
            let allCharacters = localRealm.objects(Character.self)
            characters = []
            allCharacters.forEach { char in
                characters.append(char)
            }
        }
    }
    
    func deleteCharacter(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToDelete = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToDelete.isEmpty else { return }
                try localRealm.write{
                    localRealm.delete(characterToDelete)
                    character = Character()
                    getCharacters()
                }
            } catch {
                print("Error deleting character \(id) from Realm: \(error)")
            }
        }
    }
    
    func updateCharacterName(id: ObjectId, name: String) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].name = name
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterAlignment(id: ObjectId, ethics: String, morals: String) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].moralsAlignment = morals
                    characterToUpdate[0].ethicsAlignment = ethics
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterBackground(id: ObjectId, background: CharacterBackground) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].background = background
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterAncestry(id: ObjectId, ancestry: CharacterAncestry) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].ancestry = ancestry
                    characterToUpdate[0].heritage = nil
                    characterToUpdate[0].versatileHeritage = nil
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterHeritage(id: ObjectId, heritage: CharacterHeritage) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].heritage = heritage
                    characterToUpdate[0].versatileHeritage = nil
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterVersatileHeritage(id: ObjectId, versatileHeritage: CharacterVersatileHeritage) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].heritage = nil
                    characterToUpdate[0].versatileHeritage = versatileHeritage
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterClass(id: ObjectId, currentClass: CharacterClass) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].currentClass = currentClass
                    characterToUpdate[0].initializeClassAbilities()
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterClassAbility(id: ObjectId, classAbility: CharacterClassAbility) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    for index in characterToUpdate[0].classAbilities.indices {
                        if characterToUpdate[0].classAbilities[index].name == classAbility.name && characterToUpdate[0].classAbilities[index].level == classAbility.level {
                            characterToUpdate[0].classAbilities[index] = classAbility
                        }
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterAncestryFeat(id: ObjectId, feat: CharacterFeat) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    var check = false
                    for index in characterToUpdate[0].ancestryFeats.indices {
                        if characterToUpdate[0].ancestryFeats[index].levelGained == feat.levelGained {
                            characterToUpdate[0].ancestryFeats[index] = feat
                            check = true
                        }
                    }
                    if !check {
                        characterToUpdate[0].ancestryFeats.append(feat)
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterInitialSkills(id: ObjectId, skills: RealmSwift.List<CharacterProficiency>) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].initialTrainedSkills = skills
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterInitialLanguages(id: ObjectId, languages: [String]) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].initialLanguages = RealmSwift.List<String>()
                    for lang in languages {
                        if lang != "" {
                            characterToUpdate[0].initialLanguages.append(lang)
                        }
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterSpellLists(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].initializeSpellSlots(lvl: characterToUpdate[0].level)
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterSpellListSpell(id: ObjectId, spellList: CharacterSpellList, spell: CharacterListSpell, replaceKey: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                let spellListToUpdate = characterToUpdate[0].spellLists.filter("spellSlotType == %@", spellList.spellSlotType)
                guard !spellListToUpdate.isEmpty else { return }
                try localRealm.write {
                    for index in spellListToUpdate[0].spells.indices {
                        if spellListToUpdate[0].spells[index].key == replaceKey {
                            spellListToUpdate[0].spells[index] = spell
                        }
                    }
                    getCharacters()
                }

            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    
    func updateCharacterSignatureSpell(id: ObjectId, spellList: CharacterSpellList, level: Int, spellLevel: Int, spellID: Int) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                let spellListToUpdate = characterToUpdate[0].spellLists.filter("spellSlotType == %@", spellList.spellSlotType)
                guard !spellListToUpdate.isEmpty else { return }
                try localRealm.write {
                    for l in level...20 {
                        if spellLevel <= returnReplaceSignatureSpellLevel(level: level) {
                            for sl in 0...returnReplaceSignatureSpellLevel(level: level) {
                                spellListToUpdate[0].signatureSpells[l].spellIDs[sl] = spellListToUpdate[0].signatureSpells[level-1].spellIDs[sl]
                            }
                        }
                        spellListToUpdate[0].signatureSpells[l].spellIDs[spellLevel] = spellID
                    }
                    getCharacters()
                }

            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterFormulaList(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].updateResearchField(lvl: characterToUpdate[0].level)
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterFormula(id: ObjectId, formula: CharacterListFormula, replaceKey: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    for index in characterToUpdate[0].formulaList!.formulas.indices {
                        if characterToUpdate[0].formulaList!.formulas[index].key == replaceKey {
                            characterToUpdate[0].formulaList!.formulas[index] = formula
                        }
                    }
                    getCharacters()
                }

            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterInitializeConditions(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].initializeConditions()                    
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
//    func updateCharacterConditionSpell(id: ObjectId, spell: CharacterSpell, replaceKey: ObjectId) {
//        if let localRealm = localRealm {
//            do {
//                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
//                guard !characterToUpdate.isEmpty else { return }
//                try localRealm.write {
//                    for conditionalChange in characterToUpdate[0].returnAllConditionalChanges() {
//                        if conditionalChange.key == replaceKey {
//                            conditionalChange.spell = spell
//                        }
//                    }
//                    getCharacters()
//                }
//            } catch {
//                print("Error updating character \(id) to Realm: \(error)")
//            }
//        }
//    }
//    func updateCharacterConditionFeat(id: ObjectId, feat: CharacterFeat, replaceKey: ObjectId, type: ConditionalFeatType) {
//        if let localRealm = localRealm {
//            do {
//                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
//                guard !characterToUpdate.isEmpty else { return }
//                try localRealm.write {
//                    for conditionalChange in characterToUpdate[0].returnAllConditionalChanges() {
//                        if conditionalChange.key == replaceKey {
//                            if type == .ifFeat {
//                                conditionalChange.feat = feat
//                            } else {
//                                conditionalChange.elseFeat = feat
//                            }
//                        }
//                    }
//                    getCharacters()
//                }
//            } catch {
//                print("Error updating character \(id) to Realm: \(error)")
//            }
//        }
//    }
//    func updateCharacterConditionSkill(id: ObjectId, skill: CharacterSkill, replaceKey: ObjectId, type: SkillSelType) {
//        if let localRealm = localRealm {
//            do {
//                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
//                guard !characterToUpdate.isEmpty else { return }
//                try localRealm.write {
//                    for conditionalChange in characterToUpdate[0].returnAllConditionalChanges() {
//                        if conditionalChange.key == replaceKey {
//                            if type == .ifSkill {
//                                conditionalChange.skill = skill
//                            } else {
//                                conditionalChange.elseSkill = skill
//                            }
//                        }
//                    }
//                    getCharacters()
//                }
//            } catch {
//                print("Error updating character \(id) to Realm: \(error)")
//            }
//        }
//    }
    
}
