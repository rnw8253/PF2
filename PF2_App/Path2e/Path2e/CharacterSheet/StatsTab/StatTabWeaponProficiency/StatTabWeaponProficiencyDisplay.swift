//
//  StatTabWeaponProficiencyDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/29/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabWeaponProficiencyDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    var weaponTypes = ["Unarmed","Simple","Martial"]
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                ForEach(weaponTypes, id: \.self) { weapon in
                    StatTabSingleWeaponProficiencyDisplay(weaponType: weapon)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Weapon Proficiency")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
