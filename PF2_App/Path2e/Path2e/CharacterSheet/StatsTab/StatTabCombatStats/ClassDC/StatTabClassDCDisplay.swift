//
//  StatTabClassDCDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/26/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabClassDCDisplay: View {
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.classDCBreakdownView) {
            VStack {
                Text("Class DC")
                    .font(.footnote)
                HStack {
                    Spacer()
                    ProficiencyBoxDisplay(prof: realmManager.character.returnClassDCProf(excludeRoute: nil))
                    Spacer()
                    VStack {
                        Text(signInt(realmManager.character.returnClassDCModifier(excludeRoute: nil)))
                        Text("Mod")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 5)
            .background(.white)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
