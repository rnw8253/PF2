//
//  DomainListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/24/23.


import Foundation
import RealmSwift
import SwiftUI

struct DomainListDisplay: View {
    let giveDomain: GiveDomain
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var data: LoadDataModel
    var domains: Results<DomainData> {
        if giveDomain.domains.count > 0 {
            return data.domains.where {
                $0.name.in(giveDomain.domains)
            }
        } else {
            let deity = data.deities.where {
                $0.name == realmManager.character.returnDeity()
            }
            if giveDomain.type == "Deity" {
                return data.domains.where {
                    $0.name.in(deity[0].domains)
                }
            } else if giveDomain.type == "Expanded Deity" {
                return data.domains.where {
                    $0.name.in(deity[0].alternateDomains)
                }
            } else {
                return data.domains
            }
        }
    }
    var body: some View {
        List {
            ForEach(domains, id: \.self) { domain in
                NavigationLink(value: Route.domainSelectionView(domain: domain, type: .domain, chosenFeatures: chosenFeatures)) {
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
