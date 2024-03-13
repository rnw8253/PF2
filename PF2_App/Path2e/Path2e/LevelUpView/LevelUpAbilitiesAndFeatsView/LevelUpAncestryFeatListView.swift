//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct LevelUpAncestryFeatListView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var feats: Results<FeatData> {
        var allFeats = data.feats.where {
            $0.level >= 1
        }
        allFeats = allFeats.where {
            $0.level <= realmManager.character.level
        }
        return allFeats.where {
            $0.traits.containsAny(in: realmManager.character.returnAncestryHeritageTraitIDs(excludeRoute: appState.path))
        }
    }

    var body: some View {
        VStack {
            List {
                let levelList = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]
                ForEach(levelList, id: \.self) { level in
                    let subFeats = feats.filter("level == %@", level)
                    if subFeats.count > 0 {
                        Section(header: Text("Level \(level)")) {
                            ForEach(subFeats.sorted(byKeyPath: "name"), id: \.self) { f in
                                NavigationLink(value: Route.levelUpAncestryFeatSelectionView(feat: f)) {
                                    HStack {
                                        Text(f.name)
                                        Spacer()
                                        Text("lvl \(f.level)")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationBarTitle("Feats", displayMode: .inline)
            .padding(.bottom)
        }
    }
}
