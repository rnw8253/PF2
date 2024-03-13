//
//  StatTabView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    var body: some View {
        ScrollView {
            VStack {
                StatTabHeaderDisplay()
                StatTabAbilityScoresDisplay()
                StatTabSavingThrowsDisplay()
                StatTabHealthDisplay()
                StatTabCombatStatsDisplay()
                StatTabSpeedDisplay()
                StatTabArmorProficiencyDisplay()
                StatTabWeaponProficiencyDisplay()
                StatTabLanguagesDisplay()
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}
