//
//  StateTabSavingThrowDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabSingleSavingThrowDisplay: View {
    var savingThrow: String
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.savingThrowBreakdownView(savingThrow: savingThrow)) {
            VStack {
                Text(savingThrow)
                    .font(.footnote)
                HStack {
                    Spacer()
                    ProficiencyBoxDisplay(prof: realmManager.character.returnSavingThrowProf(save: savingThrow, excludeRoute: nil))
                    Spacer()
                    VStack {
                        Text(signInt(realmManager.character.returnSavingThrowTotal(save: savingThrow, excludeRoute: nil)))
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
