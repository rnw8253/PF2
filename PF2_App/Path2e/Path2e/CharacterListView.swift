//
//  CharacterListView.swift
//  Path2e
//
//  Created by Ryan Weber on 8/22/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct CharacterListView: View {
    @EnvironmentObject var data: LoadDataModel
    @EnvironmentObject var realmManager: RealmManager
    @ObservedResults(Character.self) var characters
    @State private var showingAlert = false
    @State private var deleteRow = false
    @State private var index: IndexSet?
    @State var isTapped = false
    var body: some View {
        List {
            ForEach(characters, id: \.self) { character in
                NavigationLink(value: Route.characterSheetTabView(id: character.id)) {
                    HStack {
                        if character.ancestry != nil {
                            Image(character.ancestry!.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                        VStack {
                            HStack {
                                if character.name != "" {
                                    Text(character.name)
                                        .font(.headline)
                                } else {
                                    Text("Characters Name")
                                        .font(.headline)
                                }
                                Spacer()
                            }
                            HStack {
                                Text("\(character.ancestry?.name ?? "Ancestry") \(character.currentClass?.name ?? "Class")")
                                    .font(.caption)
                                Spacer()
                                Text("level: \(character.level)")
                                    .font(.caption)
                            }
                        }
                        Spacer()
                        if character.currentClass != nil {
                            Image(character.currentClass!.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .frame(height: 35)
                }
            }
//            .onMove(perform: $characters.move)
            .onDelete { (indexSet) in
                 self.showingAlert = true
                 self.index = indexSet
             }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Confirm Deletion"), message: Text("Are you sure you want to permanently delete this character?"), primaryButton: .destructive(Text("Delete")) { $characters.remove(atOffsets: index!)}, secondaryButton: .cancel())
            }
        }
    }
}
