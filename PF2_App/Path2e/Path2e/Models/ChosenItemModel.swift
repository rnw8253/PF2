//
//  ChosenItemModel.swift
//  Path2e
//
//  Created by Ryan Weber on 7/25/23.
//

import Foundation

class ChosenItemModel: ObservableObject, Hashable {
    static func == (lhs: ChosenItemModel, rhs: ChosenItemModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    @Published var item: ItemData? = nil
    @Published var chosenItemFeatures: ChosenFeaturesModel = ChosenFeaturesModel()
    func hash(into hasher: inout Hasher) {
        hasher.combine(chosenItemFeatures)
        hasher.combine(item)
    }
}
