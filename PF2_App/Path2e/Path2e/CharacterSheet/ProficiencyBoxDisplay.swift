//
//  ProficiencyBoxDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ProficiencyBoxDisplay: View {
    var prof: String
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Text("T")
                    .font(.caption2)
                if prof == "Trained" {
                    Image(systemName: "rectangle.portrait.fill")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("E")
                    .font(.caption2)
                if prof == "Expert" {
                    Image(systemName: "rectangle.portrait.fill")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("M")
                    .font(.caption2)
                if prof == "Master" {
                    Image(systemName: "rectangle.portrait.fill")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("L")
                    .font(.caption2)
                if prof == "Legendary" {
                    Image(systemName: "rectangle.portrait.fill")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
        }
    }
}
