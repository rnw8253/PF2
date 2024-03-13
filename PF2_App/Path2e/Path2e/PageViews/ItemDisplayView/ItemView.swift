//
//  ItemDisplayView.swift
//  PF2
//
//  Created by Ryan Weber on 1/21/22.
//

import SwiftUI
import RealmSwift

struct ItemView: View {
    var item: ItemData
    @StateObject var chosenFeatures = ChosenFeaturesModel()
    var body: some View {
        VStack {
            List {
                ItemBasicDisplay(item: item)

                if item.effects != nil {
                    EffectDisplay(effects: item.effects!, chosenFeatures: chosenFeatures)
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
                

                

            }
            .environment(\.defaultMinListRowHeight, 40)
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(item.name, displayMode: .inline)
        .padding(.bottom)
    }
}

