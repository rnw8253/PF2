//
//  HeritageDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/22/22.
//

import SwiftUI
import RealmSwift

struct HeritageView: View {
    var heritage: Heritage
    @StateObject var chosenHeritage = ChosenHeritageModel()
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
    }
}

