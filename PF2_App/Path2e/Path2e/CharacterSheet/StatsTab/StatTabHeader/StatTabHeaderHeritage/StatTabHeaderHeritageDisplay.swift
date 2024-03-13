//
//  StatTabHeaderHeritage.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI

struct StatTabHeaderHeritageDisplay: View {
    var height: CGFloat
    var borderOpaq: Double
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(realmManager.character.heritage != nil ? realmManager.character.heritage!.name : realmManager.character.versatileHeritage != nil ? realmManager.character.versatileHeritage!.name : "")
                    .minimumScaleFactor(0.5)
                Text("Heritage")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(height: height)
            Spacer()
        }
        .background(.white)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
    }
}
