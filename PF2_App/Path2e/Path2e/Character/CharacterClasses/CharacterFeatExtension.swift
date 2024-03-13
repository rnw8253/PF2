//
//  GiveCharacterEffect.swift
//  Path2e
//
//  Created by Ryan Weber on 7/29/23.
//

import Foundation
import RealmSwift

class CharacterFeat: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var level: Int
    @Persisted var rarity: String
    @Persisted var contentSrc: String
    @Persisted var descriptions: String
    @Persisted var genTypeName: String? = nil
    @Persisted var genericType: String? = nil
    @Persisted var skillID: Int? = nil
    @Persisted var actions: String? = nil
    @Persisted var cost: String? = nil
    @Persisted var frequency: String? = nil
    @Persisted var prerequisites: String? = nil
    @Persisted var requirements: String? = nil
    @Persisted var special: String? = nil
    @Persisted var trigger: String? = nil
    @Persisted var traits: RealmSwift.List<Int>
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}

