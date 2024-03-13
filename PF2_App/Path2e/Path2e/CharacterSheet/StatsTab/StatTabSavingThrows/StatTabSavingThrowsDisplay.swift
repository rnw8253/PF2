//
//  StatTabSavingThrows.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabSavingThrowsDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                ForEach(returnSavingThrow(), id: \.self) { savingThrow in
                    StatTabSingleSavingThrowDisplay(savingThrow: savingThrow)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Saving Throws")
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
