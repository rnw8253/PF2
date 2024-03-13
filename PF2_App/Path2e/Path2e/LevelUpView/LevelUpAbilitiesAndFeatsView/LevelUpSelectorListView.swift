//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI


struct LevelUpSelectorListView: View {
    let selectorID: Int
    @ObservedObject var selectorClassAbility: ChosenClassAbilityModel
    @EnvironmentObject var data: LoadDataModel
    var classAbilities: Results<ClassAbility> {
        return data.classAbilities.where {
            $0.selectOptionFor == selectorID
        }
    }
    var body: some View {
        List {
            ForEach(classAbilities, id: \.self) { cAbility in
                NavigationLink(value: Route.levelUpSelectorSelectionView(classAbility: cAbility, selectorClassAbility: selectorClassAbility)) {
                    HStack{ 
                        Text(cAbility.name)
                        Spacer()
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Class Ability Options", displayMode: .inline)
        .padding(.bottom)
    }
}
