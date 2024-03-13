//
//  AncestryPhysicalFeatureView.swift
//  PF2
//
//  Created by Ryan Weber on 3/22/22.
//

import SwiftUI
import RealmSwift

struct AncestryPhysicalFeatureSelectionView: View {
    var features: PhysicalFeature
    @ObservedObject var chosenAncestry: ChosenAncestryModel
    var index: Int
    @StateObject var chosenPhysicalFeature = ChosenPhysicalFeatureModel()
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                if features.itemWeaponID != nil {
                    NavigationLink(value: Route.itemView(item: data.items.filter("id == %@", features.itemWeaponID!)[0])) {
                        HStack{
                            Text(features.name)
                            Spacer()
                        }
                    }
                }

                if features.effects != nil {
                    EffectDisplay(effects: features.effects!, chosenFeatures: chosenPhysicalFeature.physicalFeatureFeatures)
                }

                Section(header: Text("Description")) {
                    Text(features.descriptions)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(features.name, displayMode: .inline)
        .padding(.bottom)
        Button {
            (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenPhysicalFeature.physicalFeatureFeatures)
            if alertType == nil {
                chosenPhysicalFeature.physicalFeature = features
                chosenAncestry.physicalFeatures[index] = chosenPhysicalFeature
                appState.popXViews(1)
            }
        } label: {
            Text("Choose Physical Feature")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(Capsule())
        }
    }
}
