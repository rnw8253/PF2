//
//  ContentView.swift
//  Path2e
//
//  Created by Ryan Weber on 7/17/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var appState = AppState()
    @ObservedObject var data = LoadDataModel()
    @ObservedObject var preferences = Preferences()
    @ObservedObject var realmManager = RealmManager()
    var body: some View {
        NavigationStack(path: $appState.path) {
            VStack {
                CharacterListView()
                Button {
                    let id = realmManager.addCharacter()
                    if id != nil {
                        realmManager.getCharacter(id: id!)
                        realmManager.updateCharacterInitializeConditions(id: realmManager.character.id)
                        appState.path.append(Route.newCharacterCreationView(characterID: id!))
                    }
                } label: {
                    Text("New Character")
                }

            }
            .listStyle(.grouped)
            .navigationBarTitle("Characters", displayMode: .inline)
            .padding(.top, 5)
            .navigationDestination(for: Route.self) { $0 }
        }
        .environmentObject(data)
        .environmentObject(appState)
        .environmentObject(preferences)
        .environmentObject(realmManager)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

