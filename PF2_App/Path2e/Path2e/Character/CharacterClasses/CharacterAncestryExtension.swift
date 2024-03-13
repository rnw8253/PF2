//
//  CharacterAncestryExtension.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import Foundation
import RealmSwift

class CharacterAncestry: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var physcialFeatureID: RealmSwift.List<Int>
    @Persisted var visionSenseID: Int
    @Persisted var hitPoints: Int
    @Persisted var size: String
    @Persisted var traitID: Int? = nil
    @Persisted var speed: Int
    @Persisted var rarity: String
    @Persisted var flaws: String? = nil
    @Persisted var boosts: RealmSwift.List<String>
    @Persisted var heritageIDs: RealmSwift.List<Int>
    @Persisted var physicalFeatures: RealmSwift.List<CharacterPhysicalFeature>
    @Persisted var additionalSenseID: Int? = nil
    @Persisted var languages: RealmSwift.List<String>
    @Persisted var bonusLanguages: RealmSwift.List<String>
    @Persisted var heritagesIDs: RealmSwift.List<Int>
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}

