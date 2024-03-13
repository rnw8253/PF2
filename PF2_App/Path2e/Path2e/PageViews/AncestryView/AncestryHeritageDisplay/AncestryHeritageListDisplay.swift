//
//  AncestryStatHeritageDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI
import RealmSwift

struct AncestryDisplayHeritageListView: View {
    let ancestry: AncestryData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            ForEach(ancestry.heritageIDs, id: \.self) { id in
                let heritage = data.heritages.filter("id == %@", id)[0]
                NavigationLink(value: Route.heritageView(heritage: heritage)) {
                    Text(heritage.name)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("\(ancestry.name) Heritages", displayMode: .inline)
        .padding(.bottom)
    }
}
