//
//  ItemDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import Foundation
import SwiftUI
import RealmSwift

struct FormulaSelectionView: View {
    var item: ItemData
    let index: Int
    var type: FormulaSelectionType
    @ObservedObject var chosenFeature: ChosenFeaturesModel
    @EnvironmentObject var appState: AppState
    @State var newChosenFeature: ChosenFeaturesModel = ChosenFeaturesModel()
    var body: some View {
        VStack {
            List {
                
                if item.effects != nil {
                    EffectDisplay(effects: item.effects!, chosenFeatures: newChosenFeature)
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
                
                ItemDescriptionDisplay(item: item)
                
                ItemTraitDisplay(item: item)
                
                ItemBasicDisplay(item: item)
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(item.name, displayMode: .inline)
            .padding(.bottom)
            Button {
                switch type {
                case .fieldFormula:
                    chosenFeature.fieldFormula[index] = item
                    appState.popXViews(2)
                case .alchemicalFormula:
                    chosenFeature.alchemicalFormula[index] = item
                    appState.popXViews(3)
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

enum FormulaSelectionType {
    case alchemicalFormula
    case fieldFormula
}


