//
//  ChosenAlchemicalFormulaModel.swift
//  Path2e
//
//  Created by Ryan Weber on 11/18/23.
//

import Foundation
import RealmSwift

class ChosenFormulaModel: ObservableObject, Hashable {
    @Published var formula: ItemData? = nil
    @Published var chosenFeatures: ChosenFeaturesModel? = nil
    static func == (lhs: ChosenFormulaModel, rhs: ChosenFormulaModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(formula)
    }
}
