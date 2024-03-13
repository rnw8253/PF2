import Foundation
import SwiftUI
import RealmSwift

struct SpellBasicDisplay: View {
    var spell: SpellData
    var body: some View {
        Section(header: Text("Basic Info")) {
            HStack {
                Text("Source")
                Spacer()
                Text(spell.contentSrc)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Rarity")
                Spacer()
                Text(spell.rarity.capitalized)
                    .foregroundColor(.secondary)
            }
            if spell.isFocusSpell == false {
                HStack {
                    Text("Type")
                    Spacer()
                    Text("Spell")
                        .foregroundColor(.secondary)
                }
            } else {
                HStack {
                    Text("Type")
                    Spacer()
                    Text("Focus")
                        .foregroundColor(.secondary)
                }
            }
            if spell.level == 0 {
                HStack {
                    Text("Level")
                    Spacer()
                    Text("Cantrip")
                        .foregroundColor(.secondary)
                }
            } else {
                HStack {
                    Text("Level")
                    Spacer()
                    Text(String(spell.level))
                        .foregroundColor(.secondary)
                }
            }
            if spell.cost != nil {
                HStack {
                    Text("Cost")
                    Spacer()
                    Text(spell.cost!)
                        .foregroundColor(.secondary)
                }
            }
            if spell.castingComponents.count > 0 {
                HStack {
                    Text("Casting Components")
                    Spacer()
                    Text(spell.castingComponents.joined(separator: ", "))
                        .foregroundColor(.secondary)
                }
            }
            if spell.traditions.count > 0 {
                HStack {
                    Text("Traditions")
                    Spacer()
                    Text(spell.traditions.joined(separator: ", "))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
