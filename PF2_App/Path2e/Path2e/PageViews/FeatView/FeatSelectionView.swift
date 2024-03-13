//
//  FeatDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 8/14/22.
//

import SwiftUI
import RealmSwift

struct FeatSelectionView: View {
    var feat: FeatData
    @ObservedObject var chosenFeat: ChosenFeatModel
    var popValue: Int
    @StateObject var chosenFeaturesModel = ChosenFeaturesModel()
    @EnvironmentObject var appState: AppState
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                FeatBasicDisplays(feat: feat)
                FeatActionDisplays(feat: feat)
                if feat.effects != nil {
                    EffectDisplay(effects: feat.effects!, chosenFeatures: chosenFeaturesModel)
                }
                FeatDescriptionDisplays(feat: feat)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(feat.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenFeaturesModel)
            if alertType == nil {
                chosenFeat.feat = feat
                chosenFeat.chosenFeatFeatures = chosenFeaturesModel
                print(chosenFeat.feat?.name)
                appState.popXViews(popValue)
            }
        } label: {
            Text("Choose \(feat.name)")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Capsule())
        }
    }
}
