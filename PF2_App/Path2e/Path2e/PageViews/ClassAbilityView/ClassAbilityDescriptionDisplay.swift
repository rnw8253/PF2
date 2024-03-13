//
//  ClassFeatureDescriptionDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ClassFeatureDescriptionDisplays: View {
    var classAbility: ClassAbility
    var body: some View {
        Section(header: Text("Description")) {
            Text(classAbility.descriptions)
        }
    }
}
