//
//  AncestryStatView.swift
//  PF2
//
//  Created by Ryan Weber on 1/22/22.
//

import SwiftUI
import RealmSwift

struct NewCharacterAncestrySelectionView: View {
    let ancestry: AncestryData
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @StateObject var chosenAncestry = ChosenAncestryModel()
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                Group {
                    
                    AncestryBasicDisplay(ancestry: ancestry)

                    AncestryAbilityScoreDisplay(ancestry: ancestry, chosenAncestry: chosenAncestry)
                    
                    AncestrySenseDisplay(ancestry: ancestry)

                    AncestryStatPhysicalFeatureDisplay(ancestry: ancestry, chosenAncestry: chosenAncestry)

                    AncestryFeatDisplay(ancestry: ancestry)

                    AncestryHeritageDisplay(ancestry: ancestry)

                    AncestryLanguageDisplay(ancestry: ancestry)

                    AncestryDescriptionDisplay(ancestry: ancestry)

                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(ancestry.name, displayMode: .inline)
            .padding(.bottom)
            Button {
                (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenAncestry.ancestryFeatures)
                if alertType == nil {
                    chosenAncestry.ancestry = ancestry
                    realmManager.updateCharacterAncestry(id: realmManager.character.id, ancestry: chosenAncestry.returnCharacterAncestry(levelGained: 1))
                    appState.popXViews(2)
                }
            } label: {
                Text("Choose Ancestry")
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
}

