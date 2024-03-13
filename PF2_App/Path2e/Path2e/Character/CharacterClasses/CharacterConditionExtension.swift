//
//  CharacterConditionExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import RealmSwift


class CharacterCondition: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var currentValue: Int = 0
    @Persisted var isActive: Bool = false
    @Persisted var name: String = ""
    @Persisted var hasValue: Bool = false
    @Persisted var descriptions: String = ""
    @Persisted var modifications = RealmSwift.List<CharacterModification>()
    @Persisted var tempararyModifications = RealmSwift.List<CharacterTemporaryModification>()
    @Persisted var playerCondition: CharacterGiveCondition? = nil
}

class CharacterGiveCondition: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var value: Int? = nil
}

extension Character {
    func initializeConditions() {
        var newCondition = CharacterCondition()
        for cond in LoadDataModel().conditions {
            newCondition = CharacterCondition()
            newCondition.name = cond.name
            newCondition.descriptions = cond.descriptions
            newCondition.hasValue = cond.hasValue
            if cond.effects != nil {
                if cond.effects!.modification.count > 0 {
                    var newMod = CharacterModification()
                    for mod in cond.effects!.modification {
                        newMod.category = mod.category
                        newMod.name = mod.name
                        newMod.value = mod.value
                        newMod.valueTimesTwo = mod.valueTimesTwo
                        newMod.valueTimesLevel = mod.valueTimesLevel
                        newMod.level = mod.level
                        newMod.type = mod.type
                        newMod.isPenalty = mod.isPenalty
                        newCondition.modifications.append(newMod)
                    }
                }
                if cond.effects!.temporaryModification.count > 0 {
                    var newMod = CharacterTemporaryModification()
                    for mod in cond.effects!.temporaryModification {
                        newMod = CharacterTemporaryModification()
                        newMod.category = mod.category
                        newMod.name = mod.name
                        newMod.value = mod.value
                        newMod.condition = mod.condition
                        newCondition.tempararyModifications.append(newMod)
                    }
                }
                if cond.effects!.feature != nil {
                    if cond.effects!.feature!.giveCondition != nil {
                        var newPlayerCondition = CharacterGiveCondition()
                        newPlayerCondition.name = cond.effects!.feature!.giveCondition!.name
                        newPlayerCondition.value = cond.effects!.feature!.giveCondition!.value
                        newCondition.playerCondition = newPlayerCondition
                    }
                }
            }
            conditions.append(newCondition)
        }
    }
}
