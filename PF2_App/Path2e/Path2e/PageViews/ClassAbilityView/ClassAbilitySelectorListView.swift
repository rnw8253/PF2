//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

struct ClassAbilitySelectorListView: View {
    let selectorID: Int
    @ObservedObject var chosenClassAbility: ChosenClassAbilityModel
    @EnvironmentObject var data: LoadDataModel
    var classAbilities: Results<ClassAbility> {
        return data.classAbilities.where {
            $0.selectOptionFor == selectorID
        }
    }
    var body: some View {
        List {
            ForEach(classAbilities, id: \.self) { cAbility in
                NavigationLink(value: Route.classAbilitySelectionView(classAbility: cAbility, chosenAbility: chosenClassAbility)) {
                    HStack{
                        Text(cAbility.name)
                        Spacer()
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Domains", displayMode: .inline)
        .padding(.bottom)
    }
}
