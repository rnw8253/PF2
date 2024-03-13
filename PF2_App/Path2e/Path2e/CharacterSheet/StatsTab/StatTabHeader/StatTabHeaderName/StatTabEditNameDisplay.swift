//
//  StatTabEditNameView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct StatTabHeaderNameDisplay: View {
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    @EnvironmentObject var realmManager: RealmManager
    @State private var isAlertShown = false
    @State private var newName = ""
    var body: some View {
        Button {
            isAlertShown.toggle()
        } label: {
            HStack {
                Spacer()
                VStack {
                    Text(realmManager.character.name)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    Text("Name")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .frame(height: height)
                Spacer()
            }
        }
        .buttonStyle(.plain)
        .alert("Change your Character's Name:", isPresented: $isAlertShown, actions: {
            TextField(realmManager.character.name, text: $newName)
            Button("Cancel", role: .cancel) {
                isAlertShown.toggle()
            }
            Button("Submit", role: .none) {
                realmManager.updateCharacterName(id: realmManager.character.id, name: newName)
            }

        })
        .background(.white)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
    }
}
