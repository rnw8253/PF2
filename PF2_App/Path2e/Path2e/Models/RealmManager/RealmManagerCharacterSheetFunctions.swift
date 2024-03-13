//
//  RealmManagerCharacterSheetFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import RealmSwift

extension RealmManager {
    func updateCharacterIncrementCustomAbilityScore(id: ObjectId, ability: String, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    switch ability {
                    case "Strength":
                        if increment {
                            characterToUpdate[0].strCustomScore += 1
                        } else {
                            characterToUpdate[0].strCustomScore -= 1
                        }
                    case "Dexterity":
                        if increment {
                            characterToUpdate[0].dexCustomScore += 1
                        } else {
                            characterToUpdate[0].dexCustomScore -= 1
                        }
                    case "Constitution":
                        if increment {
                            characterToUpdate[0].conCustomScore += 1
                        } else {
                            characterToUpdate[0].conCustomScore -= 1
                        }
                    case "Intelligence":
                        if increment {
                            characterToUpdate[0].intCustomScore += 1
                        } else {
                            characterToUpdate[0].intCustomScore -= 1
                        }
                    case "Charisma":
                        if increment {
                            characterToUpdate[0].chaCustomScore += 1
                        } else {
                            characterToUpdate[0].chaCustomScore -= 1
                        }
                    case "Wisdom":
                        if increment {
                            characterToUpdate[0].wisCustomScore += 1
                        } else {
                            characterToUpdate[0].wisCustomScore -= 1
                        }
                    default:
                        break
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomSavingThrow(id: ObjectId, savingThrow: String, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    switch savingThrow {
                    case "Reflex":
                        if increment {
                            characterToUpdate[0].reflexCustomSavingThrow += 1
                        } else {
                            characterToUpdate[0].reflexCustomSavingThrow -= 1
                        }
                    case "Fortitude":
                        if increment {
                            characterToUpdate[0].fortitudeCustomSavingThrow += 1
                        } else {
                            characterToUpdate[0].fortitudeCustomSavingThrow -= 1
                        }
                    case "Will":
                        if increment {
                            characterToUpdate[0].willCustomSavingThrow += 1
                        } else {
                            characterToUpdate[0].willCustomSavingThrow -= 1
                        }
                    default:
                        break
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterLevel(id: ObjectId, level: Int) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].level = level
                    getCharacters()
                }
                
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterxp(id: ObjectId, xp: Int) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if characterToUpdate[0].xp + xp < 0 {
                        characterToUpdate[0].xp = 0
                    } else {
                        characterToUpdate[0].xp += xp
                    }
                    getCharacters()
                }
                
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterHP(id: ObjectId, addHP: Int) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if addHP < 0 {
                        var newHP = 0
                        if abs(addHP) > characterToUpdate[0].tempHP {
                            newHP = addHP + characterToUpdate[0].tempHP
                            characterToUpdate[0].tempHP = 0
                            if characterToUpdate[0].currentHP + newHP < 0 {
                                characterToUpdate[0].currentHP = 0
                            } else {
                                characterToUpdate[0].currentHP += newHP
                            }
                        } else {
                            characterToUpdate[0].tempHP += addHP
                        }
                    } else {
                        if characterToUpdate[0].currentHP + addHP > characterToUpdate[0].maxHP {
                            characterToUpdate[0].currentHP = characterToUpdate[0].maxHP
                        } else if characterToUpdate[0].currentHP + addHP < 0 {
                            characterToUpdate[0].currentHP = 0
                        } else {
                            characterToUpdate[0].currentHP += addHP
                        }
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterTempHP(id: ObjectId, addHP: Int) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if characterToUpdate[0].tempHP + addHP < 0 {
                        characterToUpdate[0].tempHP = 0
                    } else {
                        characterToUpdate[0].tempHP += addHP
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterMaxHeal(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    characterToUpdate[0].currentHP = characterToUpdate[0].maxHP
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomMaxHealth(id: ObjectId, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if increment {
                        characterToUpdate[0].currentHP += 1
                        characterToUpdate[0].maxHealthCustomScore += 1
                    } else {
                        characterToUpdate[0].currentHP -= 1
                        characterToUpdate[0].maxHealthCustomScore -= 1
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCondition(id: ObjectId, condition: String, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    for index in characterToUpdate[0].conditions.indices {
                        if characterToUpdate[0].conditions[index].name == condition {
                            
                            if characterToUpdate[0].conditions[index].hasValue {
                                if increment {
                                    characterToUpdate[0].conditions[index].isActive = true
                                    if characterToUpdate[0].conditions[index].playerCondition != nil {
                                        updateCharacterIncrementCondition(id: id, condition: characterToUpdate[0].conditions[index].playerCondition!.name, increment: true)
                                    }
                                    characterToUpdate[0].conditions[index].currentValue += 1
                                } else {
                                    if characterToUpdate[0].conditions[index].currentValue > 0 {
                                        characterToUpdate[0].conditions[index].currentValue -= 1
                                        if characterToUpdate[0].conditions[index].currentValue == 0 {
                                            characterToUpdate[0].conditions[index].isActive = false
                                        }
                                    }
                                }
                            } else {
                                if increment {
                                    characterToUpdate[0].conditions[index].isActive = true
                                    if characterToUpdate[0].conditions[index].playerCondition != nil {
                                        updateCharacterIncrementCondition(id: id, condition: characterToUpdate[0].conditions[index].playerCondition!.name, increment: true)
                                    }
                                } else {
                                    characterToUpdate[0].conditions[index].isActive = false
                                }
                            }
                            
                        }
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementDyingCondition(id: ObjectId, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let dyingIndex: Int = 10
                let woundedIndex: Int = 34
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    switch characterToUpdate[0].conditions[dyingIndex].currentValue {
                    case 0:
                        if increment {
                            if characterToUpdate[0].conditions[woundedIndex].currentValue > 0 {
                                characterToUpdate[0].conditions[dyingIndex].currentValue += characterToUpdate[0].conditions[woundedIndex].currentValue
                            }
                            characterToUpdate[0].conditions[dyingIndex].currentValue += 1
                            characterToUpdate[0].conditions[dyingIndex].currentValue = min(characterToUpdate[0].conditions[dyingIndex].currentValue, characterToUpdate[0].returnMaxDyingConditon())
                            characterToUpdate[0].conditions[dyingIndex].isActive = true
                        }
                    case 1:
                        if increment {
                            characterToUpdate[0].conditions[dyingIndex].currentValue += 1
                        } else {
                            characterToUpdate[0].conditions[dyingIndex].currentValue -= 1
                            characterToUpdate[0].conditions[woundedIndex].currentValue += 1
                            characterToUpdate[0].conditions[woundedIndex].isActive = true
                            characterToUpdate[0].conditions[dyingIndex].isActive = false
                        }
                    default:
                        if increment {
                            characterToUpdate[0].conditions[dyingIndex].currentValue += 1
                            characterToUpdate[0].conditions[dyingIndex].currentValue = min(characterToUpdate[0].conditions[dyingIndex].currentValue, characterToUpdate[0].returnMaxDyingConditon())
                        } else {
                            characterToUpdate[0].conditions[dyingIndex].currentValue -= 1
                        }
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterRemoveDyingCondition(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let dyingIndex: Int = 10
                let woundedIndex: Int = 34
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if characterToUpdate[0].conditions[dyingIndex].currentValue > 0 {
                        characterToUpdate[0].conditions[woundedIndex].currentValue += 1
                        characterToUpdate[0].conditions[woundedIndex].isActive = true
                    }
                    characterToUpdate[0].conditions[dyingIndex].currentValue = 0
                    characterToUpdate[0].conditions[dyingIndex].isActive = false

                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomPerception(id: ObjectId, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if increment {
                        characterToUpdate[0].customPerceptionScore += 1
                    } else {
                        characterToUpdate[0].customPerceptionScore -= 1
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomClassDC(id: ObjectId, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if increment {
                        characterToUpdate[0].customClassDCScore += 1
                    } else {
                        characterToUpdate[0].customClassDCScore -= 1
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomAC(id: ObjectId, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    if increment {
                        characterToUpdate[0].customACScore += 1
                    } else {
                        characterToUpdate[0].customACScore -= 1
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
    func updateCharacterIncrementCustomSpeed(id: ObjectId, speedType: String, increment: Bool) {
        if let localRealm = localRealm {
            do {
                let characterToUpdate = localRealm.objects(Character.self).filter(NSPredicate(format: "id == %@", id))
                guard !characterToUpdate.isEmpty else { return }
                try localRealm.write {
                    switch speedType {
                    case "Speed":
                        if increment {
                            characterToUpdate[0].customSpeedScore += 1
                        } else {
                            characterToUpdate[0].customSpeedScore -= 1
                        }
                    case "Swim":
                        if increment {
                            characterToUpdate[0].customSwimSpeedScore += 1
                        } else {
                            characterToUpdate[0].customSwimSpeedScore -= 1
                        }
                    case "Climb":
                        if increment {
                            characterToUpdate[0].customClimbSpeedScore += 1
                        } else {
                            characterToUpdate[0].customClimbSpeedScore -= 1
                        }
                    case "Burrow":
                        if increment {
                            characterToUpdate[0].customBurrowSpeedScore += 1
                        } else {
                            characterToUpdate[0].customBurrowSpeedScore -= 1
                        }
                    case "Fly":
                        if increment {
                            characterToUpdate[0].customFlySpeedScore += 1
                        } else {
                            characterToUpdate[0].customFlySpeedScore -= 1
                        }
                    default:
                        break
                    }
                    getCharacters()
                }
            } catch {
                print("Error updating character \(id) to Realm: \(error)")
            }
        }
    }
}
