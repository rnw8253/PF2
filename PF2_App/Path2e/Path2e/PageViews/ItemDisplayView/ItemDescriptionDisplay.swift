//
//  ItemDescriptionDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemDescriptionDisplay: View {
    let item: ItemData
    var body: some View {
        Section(header: Text("Description")) {
            Text(item.descriptions)
        }
    }
}
