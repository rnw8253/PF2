//
//  StatTabXP.swift
//  Path2e
//
//  Created by Ryan Weber on 11/22/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabXPDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    var height: CGFloat = 45
    var borderOpaq: Double = 0.2
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                NavigationLink(value: Route.statTabAdjustXPView) {
                    HStack {
                        Text("XP")
                            .bold()
                        VStack(spacing: 5) {
                            Text("\(realmManager.character.xp) / 1000")
                            ProgressView(value: Float(realmManager.character.xp), total: 1000)
                                .progressViewStyle(WithBackgroundProgressViewStyle())
                        }
                    }
                }
                .buttonStyle(.plain)
                .frame(height: height)
                .padding(.horizontal)
                .background(.white)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
            }
        } label: {
            HStack {
                Spacer()
                Text("Experience")
                    .foregroundColor(.black)
                Spacer()
            }
        }

       
        .padding(.bottom)

    }
}
