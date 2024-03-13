//
//  CharacterPhysicalFeatureExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import Foundation
import RealmSwift

class CharacterPhysicalFeature: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var weaponID: Int? = nil
    @Persisted var descriptions: String
    @Persisted var name: String
    @Persisted var id: Int
    @Persisted var overrides: String?
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}


