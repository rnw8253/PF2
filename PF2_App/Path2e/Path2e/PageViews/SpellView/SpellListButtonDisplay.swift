//
//  SpellListButtonDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SpellListButtonDisplay: View {
    let spell: SpellData
    var frameHeight: CGFloat = 40
    var cornerRadius: CGFloat = 10
    var borderThickness: CGFloat = 2
    var body: some View {
        HStack {
            if spell.traitIDs.contains(1) {
                Image("Abjuration")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(228) {
                Image("Divination")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.purple, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(182) {
                Image("Transmutation")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.yellow, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(122) {
                Image("Necromancy")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.green, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(120) {
                Image("Illusion")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.teal, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(231) {
                Image("Evocation")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.orange, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(130) {
                Image("Enchantment")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.black, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(39) {
                Image("Conjuration")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.pink, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else if spell.traitIDs.contains(where: [254,183,252,6093,324,6097].contains) {
                Image("Elemental")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.red, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            } else {
                Image("Elemental")
                    .resizable()
                    .scaledToFit()
                    .frame(height: frameHeight)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.red, lineWidth: borderThickness))
                    .shadow(radius: cornerRadius)
            }
            VStack(alignment: .leading) {
                Text(spell.name)
                    .font(.headline)
                Text(spell.descriptions)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .font(.caption)
            }
        }
        .padding([.top, .bottom], 0)
        .frame(height: 25)
    }
}
