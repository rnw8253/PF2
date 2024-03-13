//
//  StatTabCombatStatsView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabCombatStatsDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                StatTabACDisplay()
                StatTabClassDCDisplay()
                StatTabPerceptionDisplay()
            }
        } label: {
            HStack {
                Spacer()
                Text("Combat Stats")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
