//
//  LevelUpFormulaListView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/20/23.
//

import Foundation
import SwiftUI
import RealmSwift


struct LevelUpFormulaCategoryListView: View {
    var listFormula: CharacterListFormula
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var types = ["Bomb","Mutagen","Elixer","Poison","Drug","Healing","Monstrocity","Ammunition","Other","All"]
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                ForEach(types, id: \.self) { type in
                    NavigationLink(value: Route.levelUpFormulaListView(listFormula: listFormula, filter: type)) {
                        VStack {
                            Image(type)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 4))
                                .shadow(radius: 10)
                                .frame(width: 150, height: 150)
                            Text(type)
                                .font(.headline)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Select a Formula Category", displayMode: .inline)
        .padding(.bottom)
    }
}
