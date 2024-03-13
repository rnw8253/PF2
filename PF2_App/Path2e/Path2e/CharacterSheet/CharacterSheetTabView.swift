//
//  CharacterSheetTabView.swift
//  Path2e
//
//  Created by Ryan Weber on 11/20/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct CharacterSheetTabView: View {
    var characterID: ObjectId
    @State var selectedIndex = 0
    @EnvironmentObject var realmManager: RealmManager
    let tabBarImageNames = ["CharacterSheetTab","CharacterSkillsTab","CharacterFeatsTab","CharacterSpellsTab","CharacterFormulasTab","CharacterItemsTab","CharacterNotesTab"]
    let tabBarText = ["Stats","Skills","Feats","Spells","Formula","Items","Notes"]
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                       StatTabView()
                    }
                case 1:
                    NavigationView {
                        Text("Skill")
                            .navigationTitle("Character Sheet")
                    }
                case 2:
                    NavigationView {
                        Text("Feats")
                            .navigationTitle("Character Sheet")
                    }
                case 3:
                    NavigationView {
                        Text("Spells")
                            .navigationTitle("Character Sheet")
                    }
                case 4:
                    NavigationView {
                        Text("Formulas")
                            .navigationTitle("Character Sheet")
                    }
                case 5:
                    NavigationView {
                        Text("Item")
                            .navigationTitle("Character Sheet")
                    }
                case 6:
                    NavigationView {
                        Text("Notes")
                            .navigationTitle("Character Sheet")
                    }
                default:
                    Text("Remaining Tabs")
                }
                
            }
            HStack {
                ForEach(0..<7) { num in
                    Button(action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        VStack {
//                            Image(tabBarImageNames[num])
                            Text(tabBarText[num])
                                .font(.system(size: 10))
                            
                        }
                        Spacer()
                    })
                }
            }
        }
        .onAppear {
            realmManager.getCharacter(id: characterID)
        }
    }
}
