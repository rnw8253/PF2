//
//  CharacterHeritageExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import Foundation
import RealmSwift

class CharacterBackground: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var boosts: RealmSwift.List<String>
    @Persisted var rarity: String
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}

