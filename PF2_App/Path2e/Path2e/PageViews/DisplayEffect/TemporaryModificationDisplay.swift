//
//  ModificationDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct TemporaryModificationDisplay: View {
    var modifications: RealmSwift.List<TemporaryModification>
    var body: some View {
        if modifications.count > 0 {
            Section(header: Text("Temporary Modifications")) {
                ForEach(modifications, id: \.self) { mod in
                    VStack {
                        switch mod.category {
                        case "Save":
                            Text("\(mod.name!) Save \(signInt(mod.value))")+Text(" ~ \(mod.condition)").foregroundColor(.secondary)
                        case "Perception":
                            Text("Perception \(signInt(mod.value))")+Text(" ~ \(mod.condition)").foregroundColor(.secondary)
                        case "AC":
                            Text("AC \(signInt(mod.value))")+Text(" ~ \(mod.condition)").foregroundColor(.secondary)
                        case "Speed":
                            Text("AC \(signInt(mod.value))")+Text(" ~ \(mod.condition)").foregroundColor(.secondary)
                        case "Skill":
                            Text("\(mod.name!) Skill \(signInt(mod.value))")+Text(" ~ \(mod.condition)").foregroundColor(.secondary)
                        default:
                            let _ = print("ERROR: Couldn't identify temporary modification")
                            let _ = print(mod.category)
                        }
                    }
                }
            }
        }
    }
}

