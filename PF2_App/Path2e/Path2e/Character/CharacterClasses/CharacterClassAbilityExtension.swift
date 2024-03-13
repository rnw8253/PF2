//
//  CharacterHeritageExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import Foundation
import RealmSwift

class CharacterClassAbility: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int? = nil
    @Persisted var name: String
    @Persisted var level: Int? = nil
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
    @Persisted var classID: Int? = nil
    @Persisted var selectType: String? = nil
    @Persisted var classAbilityName: String? = nil
    @Persisted var className: String? = nil
    @Persisted var selectOptionFor: Int? = nil
    @Persisted var selectorAbility: CharacterClassAbility? = nil
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}



extension Character {
    func initializeClassAbilities() {
        let cAbilities = LoadDataModel().classAbilities.where {
            $0.id.in(currentClass!.classAbilityIDs)
        }
        var newAbility = CharacterClassAbility()
        classAbilities = RealmSwift.List<CharacterClassAbility>()
        for cAbility in cAbilities {
            if cAbility.level != nil {
                newAbility = CharacterClassAbility()
                newAbility.name = cAbility.name
                newAbility.level = cAbility.level
                classAbilities.append(newAbility)
            }
        }
    }
}
