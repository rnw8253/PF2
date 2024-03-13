//
//  AncestryStatView.swift
//  PF2
//
//  Created by Ryan Weber on 1/22/22.
//

import SwiftUI
import RealmSwift

struct AncestryView: View {
    let ancestry: AncestryData
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
        }
    }
}

