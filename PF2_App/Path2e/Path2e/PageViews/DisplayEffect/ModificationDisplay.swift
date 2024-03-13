//
//  ModificationDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ModificationDisplay: View {
    var modifications: RealmSwift.List<Modification>
    var body: some View {
        if modifications.count > 0 {
            Section(header: Text("Modifications")) {
                ForEach(modifications, id: \.self) { mod in
                    SingleModificationDisplay(mod: mod)
                }
            }
        }
    }
}

struct SingleModificationDisplay: View {
    var mod: Modification
    var body: some View {
        HStack {
            switch mod.category {
            case "Skill":
                Text("\(mod.name!) Skill")
            case "Max Health":
                Text("Max Health")
            case "Speed":
                Text("Speed")
            case "Swim Speed":
                Text("Swim Speed")
            case "Fly Speed":
                Text("Fly Speed")
            case "Panache Speed":
                Text("Panache Speed")
            case "AC":
                Text("AC")
            case "Save":
                Text("\(mod.name!) Save")
            case "Ability Score":
                Text("\(mod.name!) Ability Score")
            case "Attack":
                Text("Attack")
            case "Perception":
                Text("Perception")
            case "Bulk Limit":
                Text("Bulk Limit")
            case "Invest Limit":
                Text("Invest Limit")
            case "Dex Cap":
                Text("Dex Cap")
            case "Melee Attacks":
                Text("Melee Attacks")
            case "Melee Attack Damage":
                Text("Melee Attacks Damage")
            default:
                let _ = print("ERROR: Couldn't identify modification")
                let _ = print(mod.category)
            }
            Spacer()
            if mod.value != nil {
                if mod.type != nil {
                    Text("\(signInt(mod.value!)) ~ \(mod.type!.capitalized)")
                        .foregroundColor(.secondary)
                } else {
                    Text("\(signInt(mod.value!))")
                        .foregroundColor(.secondary)
                }
            }
            if mod.valueTimesTwo == true {
                if mod.type != nil {
                    if mod.isPenalty {
                        Text("- Value x 2 ~ \(mod.type!.capitalized)")
                            .foregroundColor(.secondary)
                    } else {
                        Text("+ Value x 2")
                            .foregroundColor(.secondary)
                    }
                } else {
                    if mod.isPenalty {
                        Text("- Value x 2")
                            .foregroundColor(.secondary)
                    } else {
                        Text("+ Value x 2")
                            .foregroundColor(.secondary)
                    }
                }
            }
            if mod.valueTimesLevel == true {
                if mod.isPenalty {
                    Text("- Value x Character Level")
                        .foregroundColor(.secondary)
                } else {
                    Text("+ Value x Character Level")
                        .foregroundColor(.secondary)
                }
            }
            if mod.level == true {
                if mod.isPenalty {
                    Text("- Character Level")
                        .foregroundColor(.secondary)
                } else {
                    Text("+ Character Level")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
