import Foundation
import RealmSwift

class CharacterVersatileHeritage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var descriptions: String
    @Persisted var contentSrc: String
    @Persisted var rarity: String
    @Persisted var effects: CharacterEffects? = nil
    @Persisted var levelGained: Int
}
