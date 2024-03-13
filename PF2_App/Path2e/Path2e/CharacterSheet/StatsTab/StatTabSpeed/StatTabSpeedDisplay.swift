//
//  StatTabSpeedDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/28/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabSpeedDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 5)
    var speeds = ["Speed","Fly","Swim","Climb","Burrow"]
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                ForEach(speeds, id: \.self) { speedType in
                    StatTabSingleSpeedDisplay(speedType: speedType)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Speed")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
