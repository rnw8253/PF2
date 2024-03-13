//
//  StatTabSingleSpeedDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/28/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabSingleSpeedDisplay: View {
    var speedType: String
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.speedBreakdownView(speedType: speedType)) {
            HStack {
                Spacer()
                VStack {
                    Text(String(realmManager.character.returnSpeed(type: speedType)))
                    if speedType == "Speed" {
                        Text("Walk")
                            .font(.caption2)
                            .foregroundColor(Color.secondary)
                    } else {
                        Text(speedType)
                            .font(.caption2)
                            .foregroundColor(Color.secondary)
                    }
                }
                Spacer()
            }
            .padding(.vertical, 5)
            
            .background(.white)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
