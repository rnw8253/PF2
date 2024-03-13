//
//  LevelUpConditionalChangeView.swift
//  Path2e
//
//  Created by Ryan Weber on 10/19/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct LevelUpConditionalChangeView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        List {
            ForEach(realmManager.character.returnUnselectedConditionalsWithChoice(), id: \.self) { conditionalChange in
                NavigationLink(value: Route.levelUpConditionalSelectionView(characterCondition: conditionalChange, conditionalChange: realmManager.character.returnMatchingConditionalChange(conditionalChange: conditionalChange)!)) {
                    HStack {
                        Text(conditionalChange.selectedLevel == nil ? "Select Effect" : "Effect")
                        Spacer()
                        Text(conditionalChange.selectedLevel == nil ? "Unselected" : realmManager.character.returnContainingName(conditionalChange: conditionalChange) ?? "Selected")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}
