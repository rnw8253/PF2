//
//  StatTabArmorProficiencyDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/29/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabArmorProficiencyDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    var armorTypes = ["Unarmored","Light","Medium","Heavy"]
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                ForEach(armorTypes, id: \.self) { armor in
                    StatTabSingleArmorProficiencyDisplay(armorType: armor)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Armor Proficiency")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
