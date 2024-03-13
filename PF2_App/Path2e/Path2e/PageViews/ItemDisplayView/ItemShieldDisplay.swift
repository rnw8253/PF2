//
//  ItemShieldDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemShieldDisplay: View {
    let shield: Shield
    var body: some View {
        Section(header: Text("Shield")) {
            HStack {
                Text("Proficiency Name")
                Spacer()
                Text(shield.profName)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("AC Bonus")
                Spacer()
                Text(signInt(shield.acBonus))
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Speed Penalty")
                Spacer()
                Text(signInt(shield.speedPenalty))
                    .foregroundColor(.secondary)
            }
        }
    }
}
