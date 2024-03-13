//
//  FeatDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 8/14/22.
//

import SwiftUI
import RealmSwift

struct LevelUpAncestryFeatSelectionView: View {
    var feat: FeatData
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @StateObject var chosenFeat = ChosenFeatModel()
    @StateObject var chosenFeatures = ChosenFeaturesModel()
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                FeatBasicDisplays(feat: feat)
                FeatActionDisplays(feat: feat)
                if feat.effects != nil {
                    EffectDisplay(effects: feat.effects!, chosenFeatures: chosenFeatures)
                }
                FeatDescriptionDisplays(feat: feat)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(feat.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenFeatures)
            if alertType == nil {
                chosenFeat.feat = feat
                chosenFeat.chosenFeatFeatures = chosenFeatures
                realmManager.updateCharacterAncestryFeat(id: realmManager.character.id, feat: chosenFeat.returnCharacterFeat(levelGained: realmManager.character.level))
                appState.popXViews(2)
            }
        } label: {
            Text("Choose \(feat.name)")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Capsule())
        }
        .onAppear {
            chosenFeat.chosenFeatFeatures = ChosenFeaturesModel()
        }
    }
}
