//
//  HeritageDisplayFeatListView.swift
//  PF2
//
//  Created by Ryan Weber on 3/13/22.
//

import SwiftUI
import RealmSwift

struct AncestryFeatListDisplay: View {
    var ancestry: AncestryData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            let levelList = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
            let feats = data.feats.where {
                $0.traits.contains(ancestry.tagID)
            }
            ForEach(levelList, id: \.self) { level in
                let subFeats = feats.filter("level == %@", level)
                if subFeats.count > 0 {
                    Section(header: Text("Level \(level)")) {
                        ForEach(subFeats.sorted(byKeyPath: "name"), id: \.self) { feat in
                            NavigationLink(value: Route.featView(feat: feat)) {
                                HStack {
                                    Text(feat.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("\(ancestry.name) Feats", displayMode: .inline)
        .padding(.bottom)
    }
}
