//
//  StatTabDyingView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabDyingView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    var body: some View {
        List {
            Section(header: Text("Death and Dying Rules")) {
                Text("You immediately move your initiative position to directly before the turn in which you were reduced to 0 HP.")
                Text("You gain the dying 1 condition. If the effect that knocked you out was a critical success from the attacker or the result of your critical failure, you gain the dying 2 condition instead. If you have the wounded condition, increase these values by your wounded value. If the damage came from a nonlethal attack or effect, you don’t gain the dying condition— you are instead unconscious with 0 Hit Points.")
            }
            Section(header: Text("Dying Condition")) {
                NavigationLink(destination: Route.conditionView(condition: data.conditions.filter("name == 'Dying'")[0])) {
                    HStack {
                        Text("Dying")
                    }
                }
            }
        }
    }
}

