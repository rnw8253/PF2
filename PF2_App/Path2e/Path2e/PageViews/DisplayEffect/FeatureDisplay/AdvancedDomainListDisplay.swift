//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

struct AdvancedDomainListDisplay: View {
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var domains: Results<DomainData> {
        return data.domains.where {
            $0.name.in(realmManager.character.returnDomains())
        }
    }
    var body: some View {
        List {
            ForEach(domains, id: \.self) { domain in
                NavigationLink(value: Route.domainSelectionView(domain: domain, type: .advancedDomain, chosenFeatures: chosenFeatures)) {
                    HStack{
                        Text(domain.name)
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
