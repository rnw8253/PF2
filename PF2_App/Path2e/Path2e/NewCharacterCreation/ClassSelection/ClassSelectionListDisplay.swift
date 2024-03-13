//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

//struct ClassSelectionListDisplay: View {
//    @EnvironmentObject var data: LoadDataModel
//    var body: some View {
//        List {
//            ForEach(data.classes.sorted(byKeyPath: "name"), id: \.self) { cl in
//                NavigationLink(value: Route.newCharacterClassSelectionView(currentClass: cl)) {
//                    HStack {
//                        Image(cl.name)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame( width: 45, height: 45)
//                        VStack(alignment: .leading, spacing: 5) {
//                            Text(cl.name)
//                                .font(.headline)
//                        }
//                        Spacer()
//                    }
//                }
//            }
//        }
////        .listStyle(GroupedListStyle())
//        .navigationBarTitle("Select a Class", displayMode: .inline)
//        .padding(.bottom)
//    }
//}

struct ClassSelectionListDisplay: View {
    @EnvironmentObject var data: LoadDataModel
//    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 100))]
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                ForEach(data.classes.sorted(byKeyPath: "name"), id: \.self) { cl in
                    NavigationLink(value: Route.newCharacterClassSelectionView(currentClass: cl)) {
                        VStack {
                            Image(cl.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 4))
                                .shadow(radius: 10)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
//                                .frame( width: 100, height: 100)
                            Text(cl.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
//        .listStyle(GroupedListStyle())
        .navigationBarTitle("Select a Class", displayMode: .inline)
        .padding(.bottom)
    }
}
