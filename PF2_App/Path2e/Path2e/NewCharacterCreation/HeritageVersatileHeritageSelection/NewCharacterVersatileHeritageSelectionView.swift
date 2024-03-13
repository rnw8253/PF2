//
//  HeritageDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/22/22.
//

import SwiftUI
import RealmSwift

struct NewCharacterVersatileHeritageSelectionView: View {
    var versatileHeritage: VersatileHeritageData
    @StateObject var chosenVersatileHeritage = ChosenVersatileHeritageModel()
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    @EnvironmentObject var appState: AppState
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                Section(header: Text("Basic Info")) {
                    HStack {
                        Text("Source")
                        Spacer()
                        Text(versatileHeritage.contentSrc)
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Text("Rarity")
                        Spacer()
                        Text(versatileHeritage.rarity)
                            .foregroundColor(.secondary)
                    }
                }
                
                if versatileHeritage.effects != nil {
                    EffectDisplay(effects: versatileHeritage.effects!, chosenFeatures: chosenVersatileHeritage.versatileHeritageFeatures)
                }
                
                Section(header: Text("Description")) {
                    Text(versatileHeritage.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(versatileHeritage.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenVersatileHeritage.versatileHeritageFeatures)
            if alertType == nil {
                chosenVersatileHeritage.versatileHeritage = versatileHeritage
                realmManager.updateCharacterVersatileHeritage(id: realmManager.character.id, versatileHeritage: chosenVersatileHeritage.returnCharacterVersatileHeritage(levelGained: 1))
                appState.popXViews(2)
            }
        } label: {
            Text("Choose Heritage")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Capsule())
        }
        .alert(isPresented: $showAlert, content: {
            getAlert(myAlert: alertType)
        })
    }
}

