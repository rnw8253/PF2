//
//  StatTabHeaderAncestryDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI

struct StatTabHeaderAncestryDisplay: View {
    var height: CGFloat
    var borderOpaq: Double
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        HStack {
            Image(realmManager.character.ancestry!.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
            Spacer()
            VStack {
                Text(realmManager.character.ancestry!.name)
                    .minimumScaleFactor(0.5)
                Text("Ancestry")
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
