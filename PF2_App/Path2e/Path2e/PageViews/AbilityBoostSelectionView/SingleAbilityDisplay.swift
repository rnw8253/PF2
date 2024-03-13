//
//  SingleAbilityDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SingleAbilityDisplay: View {
    @Binding var tracker: AbilityScoreTracker
    var choicesLeft: Int
    var firstChoicePicked: Bool
    var body: some View {
        HStack {
            Image(tracker.ability)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame( width: 35, height: 35)
            Text(tracker.ability)
            Spacer()
            VStack{
                Text(String(tracker.currAbilityScore))
                Text("Score")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            VStack{
                Text(tracker.currAbilityMod)
                Text("Mod")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            if tracker.isBoost || tracker.isFlaw {
                HStack {
                    VStack {
                        Text(tracker.boost)
                        Text("Boost")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .frame(width: 100, alignment: .leading)
            } else if firstChoicePicked {
                if tracker.isPicked == false {
                    if choicesLeft > 0 {
                        HStack {
                            VStack {
                                Text(tracker.boost)
                                Text("Boost")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            Toggle("", isOn: $tracker.isPicked)
                                .labelsHidden()
                        }
                        .frame(width: 100, alignment: .leading)
                    } else {
                        VStack {
                            Text(tracker.boost)
                            Text("Boost")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(width: 100, alignment: .leading)
                    }
                } else {
                    HStack {
                        VStack {
                            Text(tracker.boost)
                            Text("Boost")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                            Toggle("", isOn: $tracker.isPicked)
                                .labelsHidden()
                    }
                    .frame(width: 100, alignment: .leading)
                }
            } else {
                HStack {
                    VStack {
                        Text(tracker.boost)
                        Text("Boost")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    if tracker.isFirstOption || tracker.isPicked {
                        Toggle("", isOn: $tracker.isPicked)
                            .labelsHidden()
                    }
                }
                .frame(width: 100, alignment: .leading)
            }
        }
    }
}
