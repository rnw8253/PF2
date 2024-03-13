//
//  StatTabAbilities.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabAbilityScoresDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                ForEach(returnAbilityList(), id: \.self) { ability in
                    StatTabSingleAbilityScoreDisplay(ability: ability)
                }
            }
        } label: {
            HStack {
                Spacer()
                Text("Ability Scores")
                    .foregroundColor(.black)
                Spacer()
            }
        }

       
//        .padding(.bottom)

    }
}
