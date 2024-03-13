//
//  ItemRuneDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemRuneDisplay: View {
    let rune: Rune
    var body: some View {
        Section(header: Text("Rune")) {
            HStack {
                Text("Type")
                Spacer()
                Text(String(rune.etchedType))
                    .foregroundColor(.secondary)
            }
            if rune.isFundamental == true {
                HStack {
                    Text("Fundemental Rune")
                    Spacer()
                }
            }
        }
    }
}
