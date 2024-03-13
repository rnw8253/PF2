//
//  ItemDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import Foundation
import SwiftUI
import RealmSwift

struct ItemSelectionView: View {
    var item: ItemData
    @ObservedObject var chosenFeature: ChosenFeaturesModel
    @EnvironmentObject var appState: AppState
    @StateObject var chosenItem = ChosenItemModel()
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        VStack {
            List {
                ItemBasicDisplay(item: item)
                
                if item.effects != nil {
                    EffectDisplay(effects: item.effects!, chosenFeatures: chosenItem.chosenItemFeatures)
                }
                
                if item.weapon != nil {
                    ItemWeaponDisplay(weapon: item.weapon!)
                }
                
                if item.armor != nil {
                    ItemArmorDisplay(armor: item.armor!)
                }
                
                if item.shield != nil {
                    ItemShieldDisplay(shield: item.shield!)
                }
                
                //                ItemStorageDisplay(item: item)
                
                if item.rune != nil {
                    ItemRuneDisplay(rune: item.rune!)
                }
                
                ItemTraitDisplay(item: item)
                
                ItemDescriptionDisplay(item: item)
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(item.name, displayMode: .inline)
            .padding(.bottom)
            Button {
                (showAlert,alertType) = checkChosenFeature(chosenFeatures: chosenItem.chosenItemFeatures)
                if alertType == nil {
                    chosenItem.item = item
                    chosenFeature.rageWeapon = chosenItem
                    appState.popXViews(2)
                }
            } label: {
                Text("Choose \(item.name)")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Capsule())
            }
        }
    }
}

