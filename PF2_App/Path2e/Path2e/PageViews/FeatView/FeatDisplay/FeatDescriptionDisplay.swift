//
//  FeatDescriptionDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI
import RealmSwift

struct FeatDescriptionDisplays: View {
    let feat: FeatData
    var body: some View {
        Section(header: Text("Description")) {
            Text(feat.descriptions)
        }
        
        if feat.special != nil {
            Section(header: Text("Special")) {
                HStack {
                    Text(feat.special!)
                }
            }
        }
    }
}

