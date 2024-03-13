//
//  StatTabHeaderClassDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI

struct StatTabHeaderClassDisplay: View {
    var height: CGFloat
    var borderOpaq: Double
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        HStack {
            Image(realmManager.character.currentClass!.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
            Spacer()
            VStack {
                Text(realmManager.character.currentClass!.name)
                    .minimumScaleFactor(0.5)
                Text("Class")
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

