//
//  StatTabeHeaderLevelDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI

struct StatTabHeaderLevelDisplay: View {
    var height: CGFloat
    var borderOpaq: Double
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.statTabAdjustXPView) {
            HStack {
                Spacer()
                VStack {
                    ProgressView(value: Float(realmManager.character.xp), total: 1000)
                        .progressViewStyle(WithBackgroundProgressViewStyle())
                    VStack {
                        Text(realmManager.character.levelString)
                        Text("Level")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .frame(height: height)
                Spacer()
            }
        }
        .buttonStyle(.plain)
        .background(.white)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
    }
}
