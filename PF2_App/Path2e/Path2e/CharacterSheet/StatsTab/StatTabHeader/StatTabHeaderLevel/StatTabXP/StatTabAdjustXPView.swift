//
//  StatTabAdjustXPView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct StatTabAdjustXPView: View {
    @State var numberStr: String = "0"
    @EnvironmentObject var realmManager: RealmManager
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    var body: some View {
        VStack {
//            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                    HStack {
                        Text("XP")
                            .bold()
                        VStack(spacing: 5) {
                            Text("\(realmManager.character.xp) / 1000")
                            ProgressView(value: Float(realmManager.character.xp), total: 1000)
                                .progressViewStyle(WithBackgroundProgressViewStyle())
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(height: height)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
                }
                Spacer()
                CustomKeyPad(numberStr: $numberStr, keyWidth: 75)
                    .frame(width: 240)
                    .padding(.horizontal)
                Button {
                    realmManager.updateCharacterxp(id: realmManager.character.id, xp: Int(numberStr)!)
                    if numberStr.prefix(1) == "-" {
                        numberStr = "-0"
                    } else {
                        numberStr = "0"
                    }
                } label: {
                    Text(numberStr.prefix(1) == "-" ? "Subtract Experience" : "Add Experience")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                        .shadow(radius: 10)
                }
                Spacer()
//            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .background(Color(UIColor.secondarySystemBackground))
            if realmManager.character.xp >= 1000 {
                Button {
                    realmManager.updateCharacterxp(id: realmManager.character.id, xp: -1000)
                } label: {
                    Text("Level Up")
                        .bold()
                        .frame(width: 280, height: 50)
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemRed),Color(.systemOrange)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(Capsule())
                }
            } else {
                Button {
                    realmManager.updateCharacterxp(id: realmManager.character.id, xp: -1000)
                    realmManager.updateCharacterLevel(id: realmManager.character.id, level: 2)
                } label: {
                    Text("Force Level Up")
                        .bold()
                        .frame(width: 280, height: 50)
                        .foregroundColor(Color.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemTeal),Color(.systemGreen)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(Capsule())
                }
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
    }
}



