//
//  StatTabLanguagesDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 11/28/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct StatTabLanguagesDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @State var expandDisclosure: Bool = true
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    var height: CGFloat = 40
    var borderOpaq: Double = 0.2
    var body: some View {
        DisclosureGroup(isExpanded: $expandDisclosure) {
            LazyVGrid(columns: adaptiveColumns, spacing: 0) {
                HStack {
                    Spacer()
                    Text(realmManager.character.returnKnownLanguagesString(excludeRoute: nil))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: height)
                .padding(.vertical, 5)
                
                .background(.white)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.gray.opacity(borderOpaq)))
            }
        } label: {
            HStack {
                Spacer()
                Text("Language")
                    .foregroundColor(.black)
                Spacer()
            }
            
        }
    }
}
