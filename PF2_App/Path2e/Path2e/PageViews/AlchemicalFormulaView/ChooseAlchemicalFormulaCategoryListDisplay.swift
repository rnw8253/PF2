//
//  ChooseAlchemicalFormulaCategoryListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 10/17/23.
//
import Foundation
import RealmSwift
import SwiftUI

struct ChooseAlchemicalFormulaCategoryListView: View {
    var level: Int
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    var index: Int
    @EnvironmentObject var data: LoadDataModel
    var types = ["Bomb","Mutagen","Elixer","Poison","Drug","Healing","Monstrocity","Ammunition","Other","All"]
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 145))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                ForEach(types, id: \.self) { type in
                    NavigationLink(value: Route.chooseAlchemicalFormulaListDisplay(level: level, chosenFeatures: chosenFeatures, index: index, filter: type)) {
                        VStack {
                            Image(type)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 4))
                                .shadow(radius: 10)
                                .frame(width: 145, height: 145)
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
