//
//  ItemDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import Foundation
import SwiftUI
import RealmSwift


struct LevelUpFormulaSelectionView: View {
    var item: ItemData
    var listFormula: CharacterListFormula
    @EnvironmentObject var realmManager: RealmManager
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
                let newFormula = CharacterListFormula()
                newFormula.name = item.name
                newFormula.id = item.id
                newFormula.levelGained = listFormula.levelGained
                realmManager.updateCharacterFormula(id: realmManager.character.id, formula: newFormula, replaceKey: listFormula.key)
                let _ = print(appState.path)
                appState.popXViews(3)
                
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


