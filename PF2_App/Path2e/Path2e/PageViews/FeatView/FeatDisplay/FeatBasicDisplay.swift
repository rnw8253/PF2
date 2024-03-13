//
//  FeatBasicDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct FeatBasicDisplays: View {
    let feat: FeatData
    var body: some View {
        Section(header: Text("Basic Info")) {
            HStack {
                Text("Source")
                Spacer()
                Text(feat.contentSrc)
                    .foregroundColor(.secondary)
            }
            
            if feat.rarity != "" {
                HStack {
                    Text("Rarity")
                    Spacer()
                    Text(feat.rarity.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            
            if feat.genericType != nil {
                switch feat.genericType {
                case "SKILL-FEAT":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Skill Feat")
                            .foregroundColor(.secondary)
                    }
                case "SKILL-ACTION":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Skill Action")
                            .foregroundColor(.secondary)
                    }
                case "GENERAL-FEAT":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("General Feat")
                            .foregroundColor(.secondary)
                    }
                case "CLASS-FEAT":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Class Feat (\(feat.genTypeName!))")
                            .foregroundColor(.secondary)
                    }
                case "BASIC-ACTION":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Basic Action")
                            .foregroundColor(.secondary)
                    }
                case "ARCHETYPE-FEAT":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Archetype Feat (\(feat.genTypeName!))")
                            .foregroundColor(.secondary)
                    }
                case "ANCESTRY-FEAT":
                    HStack {
                        Text("Type")
                        Spacer()
                        Text("Ancestry Feat (\(feat.genTypeName!))")
                            .foregroundColor(.secondary)
                    }
                case nil:
                    let _ = print("")
                default:
                    let _ = print("ERROR: Couldn't determine feat type")

                }
            }
            if feat.level >= 0 {
                HStack {
                    Text("Level")
                    Spacer()
                    Text(String(feat.level))
                        .foregroundColor(.secondary)
                }
            }
            if feat.prerequisites != nil {
                HStack {
                    Text("Prereqs")
                    Spacer()
                    Text(feat.prerequisites!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            if feat.requirements != nil {
                HStack {
                    Text("Requirements")
                    Spacer()
                    Text(feat.requirements!.capitalized)
                        .foregroundColor(.secondary)
                }
            }
            if feat.cost != nil {
                HStack {
                    Text("Cost")
                    Spacer()
                    Text(feat.cost!)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

