//
//  Ancestry.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//
import Foundation
import RealmSwift
import SwiftUI

struct AncestrySelectionListDisplay: View {
    @EnvironmentObject var data: LoadDataModel
//    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 100))]
    private let adaptiveColumns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    var rarity = ["Common","Uncommon","Rare"]
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(rarity, id: \.self) {rar in
                    let ancestries = data.ancestries.filter("rarity ==[c] %@", rar)
                    Section(header: Text("\(rar) Ancestry").font(.largeTitle)) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(ancestries.sorted(byKeyPath: "name"), id: \.self) { ancestry in
                                NavigationLink(value: Route.newCharacterAncestrySelectionView(ancestry: ancestry)) {
                                    VStack {
                                        Image(ancestry.name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                            .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 4))
                                            .shadow(radius: 10)
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                                        Text(ancestry.name)
                                            .font(.headline)
                                        //                                        HStack {
                                        //                                            Text("Boosts:")
                                        //                                                .font(.subheadline)
                                        //                                                .foregroundColor(.secondary)
                                        //                                            ForEach(ancestry.boosts , id: \.self) { boost in
                                        //                                                if boost == "Anything" {
                                        //                                                    Text("Free")
                                        //                                                        .font(.subheadline)
                                        //                                                        .foregroundColor(.secondary)
                                        //                                                } else {
                                        //                                                    Text(boost.prefix(3))
                                        //                                                        .font(.subheadline)
                                        //                                                        .foregroundColor(.secondary)
                                        //                                                }
                                        //                                            }
                                        //                                            Spacer()
                                        //                                            if (ancestry.flaws != nil) {
                                        //                                                HStack {
                                        //                                                    Text("Flaw:")
                                        //                                                        .font(.subheadline)
                                        //                                                        .foregroundColor(.secondary)
                                        //                                                    Text(ancestry.flaws!.prefix(3))
                                        //                                                        .font(.subheadline)
                                        //                                                        .foregroundColor(.secondary)
                                        //                                                }
                                        //                                            }
                                        //                                        }
                                        //                                    }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle("Select an Ancestry", displayMode: .inline)
        .padding(.bottom)
    }
}
