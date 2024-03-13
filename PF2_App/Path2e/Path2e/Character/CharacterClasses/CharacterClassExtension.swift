//
//  GiveCharacterClass.swift
//  Path2e
//
//  Created by Ryan Weber on 7/30/23.
//

import Foundation
import RealmSwift

class CharacterClass: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var classProfs: RealmSwift.List<CharacterProficiency>
    @Persisted var rarity: String
    @Persisted var traitID: Int
    @Persisted var hitPoints: Int
    @Persisted var keyAbility: String? = nil
    @Persisted var classAbilityIDs: RealmSwift.List<Int>
    @Persisted var additionalTrainedSkills: Int
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}


