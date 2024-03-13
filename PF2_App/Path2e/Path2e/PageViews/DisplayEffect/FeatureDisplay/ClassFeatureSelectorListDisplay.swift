//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

struct ClassFeatureSelectorListDisplay: View {
    let selectorID: Int
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    let index: Int
    @EnvironmentObject var data: LoadDataModel
    var classAbilities: Results<ClassAbility> {
        return data.classAbilities.where {
            $0.selectOptionFor == selectorID
        }
    }
    var body: some View {
        List {
            ForEach(classAbilities, id: \.self) { cAbility in
                NavigationLink(value: Route.classFeatureSelectionDisplay(classAbility: cAbility, chosenFeatures: chosenFeatures, index: index, screenPop: 2)) {
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
