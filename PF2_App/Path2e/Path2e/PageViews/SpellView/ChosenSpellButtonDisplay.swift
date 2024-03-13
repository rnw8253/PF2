//
//  GiveSpellButtonDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/18/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct ChosenSpellButtonDisplay: View {
    var spell: SpellData
    var type: String? = nil
    var cornerRadius: CGFloat = 10
    var borderThickness: CGFloat = 1
    var body: some View {
        HStack {
            if spell.traitIDs.contains(1) {
                Image("Abjuration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(228) {
                Image("Divination")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.purple, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(182) {
                Image("Transmutation")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.yellow, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(122) {
                Image("Necromancy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.green, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(120) {
                Image("Illusion")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.teal, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(231) {
                Image("Evocation")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.orange, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(130) {
                Image("Enchantment")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.black, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(39) {
                Image("Conjuration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.pink, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(where: [254,183,252,6093,324,6097].contains) {
                Image("Elemental")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.red, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else {
                Image("Elemental")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.red, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            }
            VStack(alignment: .leading) {
                Text(spell.name)
                if type != nil {
                    Text("\(type!) Spell")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            Text("lvl: \(spell.level)")
        }
        .frame(height: 30)
    }
}
