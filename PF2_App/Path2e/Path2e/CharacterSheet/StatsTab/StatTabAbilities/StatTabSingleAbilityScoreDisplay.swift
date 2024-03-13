//
//  StatTabAbilityScoreDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabSingleAbilityScoreDisplay: View {
    var ability: String
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.abilityScoreBreakdownView(ability: ability)) {
            HStack {
                Image(ability)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: height)
                Text(ability.prefix(3).uppercased())
                    .bold()
                Spacer()
                VStack {
                    Text(String(realmManager.character.returnAbilityScore(ability: ability, excludeRoute: nil)))
                    Text("Score")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                VStack {
                    Text(signInt(realmManager.character.returnAbilityScoreMod(ability: ability, excludeRoute: nil)))
                    Text("Mod")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(.trailing)
            }
            .background(.white)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
