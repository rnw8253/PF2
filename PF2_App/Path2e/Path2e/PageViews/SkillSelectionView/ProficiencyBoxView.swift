//
//  ProficiencyView.swift
//  PF2
//
//  Created by Ryan Weber on 2/12/22.
//

import SwiftUI
import RealmSwift

struct ProficiencyBoxView: View {
    var prof: String
    var initProf: String
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Text("T")
                    .font(.caption2)
                if prof == "Trained" {
                    Image(systemName: "rectangle.portrait.fill")
                } else if initProf == "Trained" {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("E")
                    .font(.caption2)
                if prof == "Expert" {
                    Image(systemName: "rectangle.portrait.fill")
                } else if initProf == "Expert" {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("M")
                    .font(.caption2)
                if prof == "Master" {
                    Image(systemName: "rectangle.portrait.fill")
                } else if initProf == "Master" {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
            VStack {
                Text("L")
                    .font(.caption2)
                if prof == "Legendary" {
                    Image(systemName: "rectangle.portrait.fill")
                } else if initProf == "Legendary" {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                } else {
                    Image(systemName: "rectangle.portrait")
                }
            }
        }
    }
}

