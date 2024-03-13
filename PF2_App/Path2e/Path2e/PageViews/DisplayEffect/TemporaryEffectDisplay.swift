//
//  ModificationDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct TemporaryEffectDisplay: View {
    var modifications: RealmSwift.List<TemporaryEffects>
    var body: some View {
        if modifications.count > 0 {
            Section(header: Text("Temporary Effects")) {
                ForEach(modifications, id: \.self) { mod in
                    VStack {
                        switch mod.category {
                        case "Save":
                            Text("\(mod.name!) Save")+Text(" ~ \(mod.effect)").foregroundColor(.secondary)
                        case "Attack Damage":
                            Text("Attack Damage")+Text(" ~ \(mod.effect)").foregroundColor(.secondary)
                        case "Speed":
                            Text("Speed")+Text(" ~ \(mod.effect)").foregroundColor(.secondary)
                        default:
                            let _ = print("ERROR: Couldn't identify temporary effect")
                            let _ = print(mod.category)
                        }
                    }
                }
            }
        }
    }
}

