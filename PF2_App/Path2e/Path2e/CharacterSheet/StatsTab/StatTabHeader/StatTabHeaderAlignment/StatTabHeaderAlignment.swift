//
//  StatTabHeaderAlignment.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabHeaderAlignmentDisplay: View {
    var height: CGFloat
    var borderOpaq: Double
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        NavigationLink(value: Route.statTabHeaderChangeAlignment) {
            HStack {
                Spacer()
                Image(systemName: realmManager.character.alignmentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(realmManager.character.alignmentColor))
                    .frame(height: height)
                VStack {
                    Text(realmManager.character.alignmentAbbrev)
                    Text("Alignment")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
        .buttonStyle(.plain)
        .background(.white)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
    }
}
