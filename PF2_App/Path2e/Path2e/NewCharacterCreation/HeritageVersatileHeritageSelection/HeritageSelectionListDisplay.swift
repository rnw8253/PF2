//
//  NewCharacterHeritageSelectionView.swift
//  Path2e
//
//  Created by Ryan Weber on 7/31/23.
//

import SwiftUI
import RealmSwift

struct HeritageSelectionListDisplay: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            let ancestry =  data.ancestries.filter("name == %@",realmManager.character.ancestry!.name)[0]
            Section(header: Text("\(realmManager.character.ancestry!.name) Heritages")) {
                ForEach(ancestry.heritages.sorted(byKeyPath: "name"), id: \.self) { heritage in
                    NavigationLink(value: Route.newCharacterHeritageSelectionView(heritage: heritage)) {
                        HStack {
                            Text(heritage.name)
                            Spacer()
                        }
                    }
                }
            }
            Section(header: Text("Versatile Heritages")) {
                ForEach(data.versatileHeritages.sorted(byKeyPath: "name"), id: \.self) { vh in
                    NavigationLink(value: Route.newCharacterVersatileHeritageSelectionView(versatileHeritage: vh)) {
                        HStack {
                            Text(vh.name)
                            Spacer()
                        }
                    }
                }
            }
        }
//        .listStyle(GroupedListStyle())
        .navigationBarTitle("Select a Heritage", displayMode: .inline)
        .padding(.bottom)
    }
}
