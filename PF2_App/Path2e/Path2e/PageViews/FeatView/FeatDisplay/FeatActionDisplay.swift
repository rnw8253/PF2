//
//  FeatActionDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct FeatActionDisplays: View {
    let feat: FeatData
    var body: some View {
        if feat.actions! != "NONE" || feat.frequency != nil || feat.trigger != nil {
            Section(header: Text("Action Info")) {
                if feat.actions != nil {
                    if feat.actions != "NONE" {
                        HStack {
                            Text("Casting Time")
                            Spacer()
                            switch feat.actions {
                            case "ACTION":
                                Text("Single Action")
                                    .foregroundColor(.secondary)
                            case "TWO_ACTIONS":
                                Text("Two Actions")
                                    .foregroundColor(.secondary)
                            case "THREE_ACTIONS":
                                Text("Three Actions")
                                    .foregroundColor(.secondary)
                            case "REACTION":
                                Text("Reaction")
                                    .foregroundColor(.secondary)
                            case "FREE_ACTION":
                                Text("Free Action")
                                    .foregroundColor(.secondary)
                            case "5_MINUTES":
                                Text("5 Minutes")
                                    .foregroundColor(.secondary)
                            case "TEN_MINUTES":
                                Text("10 Minutes")
                                    .foregroundColor(.secondary)
                            case "THIRTY_MINUTES":
                                Text("30 Minutes")
                                    .foregroundColor(.secondary)
                            case "ONE_HOUR":
                                Text("1 Hour")
                                    .foregroundColor(.secondary)
                            case "ONE_MINUTE":
                                Text("1 Minute")
                                    .foregroundColor(.secondary)
                            case "ONE_TO_THREE_ACTIONS":
                                Text("1 to 3 Actions")
                                    .foregroundColor(.secondary)
                            case "TWO_TO_THREE_ACTIONS":
                                Text("2 to 3 Actions")
                                    .foregroundColor(.secondary)
                            case "TWO_TO_TWO_ROUNDS":
                                Text("2 Actions to 2 Rounds")
                                    .foregroundColor(.secondary)
                            default:
                                Text("spell.actions")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                if feat.frequency != nil {
                    HStack {
                        Text("Frequency")
                        Spacer()
                        Text(feat.frequency!.capitalized)
                            .foregroundColor(.secondary)
                    }
                }
                if feat.trigger != nil {
                    HStack {
                        Text("Trigger")
                        Spacer()
                        Text(feat.trigger!.capitalized)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}


