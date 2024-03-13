//
//  ClassFeatureBasicDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ClassFeatureBasicDisplays: View {
    let classAbility: ClassAbility
    var body: some View {
        Section(header: Text("Basic Info")) {
            HStack {
                Text("Source")
                Spacer()
                Text(classAbility.contentSrc)
                    .foregroundColor(.secondary)
            }
            if classAbility.level != nil {
                HStack {
                    Text("Level")
                    Spacer()
                    Text(String(classAbility.level!))
                        .foregroundColor(.secondary)
                }
            }
            if classAbility.className != nil {
                HStack {
                    Text("Class")
                    Spacer()
                    Text(classAbility.className!)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

