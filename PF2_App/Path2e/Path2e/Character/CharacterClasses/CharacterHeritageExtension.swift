//
//  CharacterHeritageExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import Foundation
import RealmSwift

class CharacterHeritage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var ancestryID: Int? = nil
    @Persisted var ancestryName: String? = nil
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}
