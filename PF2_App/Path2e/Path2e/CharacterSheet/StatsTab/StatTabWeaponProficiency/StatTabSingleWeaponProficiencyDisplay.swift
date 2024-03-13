//
//  StatTabSingleWeaponProficiencyDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/29/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabSingleWeaponProficiencyDisplay: View {
    var weaponType: String
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
//        NavigationLink(value: Route.savingThrowBreakdownView(savingThrow: savingThrow)) {
            VStack {
                Text(weaponType)
                    .font(.footnote)
                HStack {
                    Spacer()
                    ProficiencyBoxDisplay(prof: realmManager.character.returnWeaponCategoryProf(weaponCategory: weaponType))
                    Spacer()
                }
            }
            .padding(.vertical, 5)
            
            .background(.white)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
//        }
//        .buttonStyle(PlainButtonStyle())
    }
}
