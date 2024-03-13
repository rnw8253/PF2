//
//  ChooseFeatList.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct ChooseFeatFromListDisplay: View {
    var selection: ChooseFeatFromList
    @ObservedObject var chosenFeat: ChosenFeatModel
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            ForEach(selection.options, id: \.self) { name in
                let filteredFeats = data.feats.filter("name == %@", name)
                if filteredFeats.count > 0 {
                    NavigationLink(value : Route.featSelectionView(feat: filteredFeats[0], chosenFeat: chosenFeat, popValue: 2)) {
                        HStack {
                            Text(filteredFeats[0].name)
                            Spacer()
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(selection.choice, displayMode: .inline)
        .padding(.bottom)
    }
}
