//
//  HeritageDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/22/22.
//

import SwiftUI
import RealmSwift

struct NewCharacterHeritageSelectionView: View {
    var heritage: Heritage
    @StateObject var chosenHeritage = ChosenHeritageModel()
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
                        Text(heritage.contentSrc)
                            .foregroundColor(.secondary)
                    }
                }
                
                if heritage.effects != nil {
                    EffectDisplay(effects: heritage.effects!, chosenFeatures: chosenHeritage.heritageFeatures)
                }
                
                Section(header: Text("Description")) {
                    Text(heritage.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(heritage.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenHeritage.heritageFeatures)
            if alertType == nil {
                chosenHeritage.heritage = heritage
                realmManager.updateCharacterHeritage(id: realmManager.character.id, heritage: chosenHeritage.returnCharacterHeritage(levelGained: 1))
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

