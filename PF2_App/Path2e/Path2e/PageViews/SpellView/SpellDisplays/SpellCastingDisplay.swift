//
//  SpellCastingDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct SpellCastingDisplays: View {
    let spell: SpellData
    var body: some View {
        Section(header: Text("Casting Info")) {
            if spell.cast != nil {
                HStack {
                    Text("Casting Time")
                    Spacer()
                    switch spell.cast {
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
                    case "FIVE_MINUTES":
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
                    case "ONE_TO_TWO_ACTIONS":
                        Text("1 to 2 Actions")
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
                        Text("Read Description")
                            .foregroundColor(.secondary)
                    }
                }
            }
            if spell.requirements != nil {
                HStack {
                    Text("Requirements")
                    Spacer()
                    Text(spell.requirements!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            if spell.trigger != nil {
                HStack {
                    Text("Trigger")
                    Spacer()
                    Text(spell.trigger!.capitalized)
                        .foregroundColor(.secondary)
                }
            }

            if spell.duration != nil {
                HStack {
                    Text("Duration")
                    Spacer()
                    Text(spell.duration!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            if spell.area != nil {
                HStack {
                    Text("Area")
                    Spacer()
                    Text(spell.area!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            if spell.range != nil {
                HStack {
                    Text("Range")
                    Spacer()
                    Text(spell.range!)
                        .foregroundColor(.secondary)
                }
            }
            if spell.targets != nil {
                HStack {
                    Text("Targets")
                    Spacer()
                    Text(spell.targets!)
                        .foregroundColor(.secondary)
                }
            }
            if spell.savingThrow != nil {
                HStack{
                    Text("Saving Throw")
                    Spacer()
                    switch spell.savingThrow! {
                    case "FORT","BASIC_FORT":
                        Text("Fortitude")
                            .foregroundColor(.secondary)
                    case "REFLEX","BASIC_REFLEX":
                        Text("Reflex")
                            .foregroundColor(.secondary)
                    case "WILL","BASIC_WILL":
                        Text("Will")
                            .foregroundColor(.secondary)
                    default:
                        Text(spell.savingThrow!)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

