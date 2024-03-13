//
//  StatTabHeaderDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabHeaderDisplay: View {
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                StatTabHeaderNameDisplay(height: height, borderOpaq: borderOpaq)
                StatTabHeaderAlignmentDisplay(height: height, borderOpaq: borderOpaq)
                StatTabHeaderLevelDisplay(height: height, borderOpaq: borderOpaq)
                StatTabHeaderAncestryDisplay(height: height, borderOpaq: borderOpaq)
                StatTabHeaderHeritageDisplay(height: height, borderOpaq: borderOpaq)
                StatTabHeaderClassDisplay(height: height, borderOpaq: borderOpaq)
            }
        } label: {
            HStack {
                Spacer()
                Text("Profile")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}

