//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct DeityListDisplay: View {
    let type: String
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var data: LoadDataModel
    @State var filterType: String = "Name"
    @State var nameFilter: String = "All"
    @State var domainFilter: String = "All"
    @State var alignmentFilter: String = "All"
    let letters = ["A","B","C","D","E","F","G","H","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let fa = ["LG","LN","LE","NG","NN","NE","CG","CN","CE"]
    let fafull = ["Lawful Good", "Lawful Neutral", "Lawful Evil", "Neutral Good", "True Neutral", "Neutral Evil", "Chaotic Good", "Chaotic Neutral", "Chaotic Evil"]
    var deities: Results<DeityData> {
        var allDeities = data.deities.where {
            $0.domains.count > 0
        }
        allDeities = allDeities.where {
            $0.favoredWeapon.count > 0
        }
        allDeities = allDeities.where {
            $0.clericSpells.count > 0
        }
        allDeities = allDeities.where {
            $0.divineFont.count > 0
        }
        allDeities = allDeities.where {
            $0.divineAbility.count > 0
        }
        switch type {
        
        case "Pharasma":
            allDeities = allDeities.where {
                $0.name == "Pharasma"
            }
        case "Paladin (Lawful Good)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("LG")
            }
        case "Redeemer (Neutral Good)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("NG")
            }
        case "Liberator (Chaotic Good)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("CG")
            }
        case "Tyrant (Lawful Evil)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("LE")
            }
        case "Desecrator (Neutral Evil)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("NE")
            }
        case "Antipaladin (Chaotic Evil)":
            allDeities = allDeities.where {
                $0.followerAlignments.contains("CE")
            }
        case "Cleric":
            let _ = print("")
        default:
            let _ = print("Error: Did not recognize Deity Select Type")
        }
        switch filterType {
        case "Name":
            if nameFilter == "All" {
                return allDeities
            } else {
                return allDeities.where {
                    $0.name.starts(with: nameFilter, options: .caseInsensitive)
                }
            }
        case "Domain":
            if domainFilter == "All" {
                return allDeities
            } else {
                return allDeities.where {
                    $0.domains.contains(domainFilter)
                }
            }
        case "Alignment":
            if alignmentFilter == "All" {
                return allDeities
            } else {
                return allDeities.where {
                    $0.alignment.contains(alignmentFilter)
                }
            }
        default:
            return allDeities
        }
    }
    var body: some View {
        Picker("Filter Type", selection: $filterType) {
            Text("Name").tag("Name")
            Text("Alignment").tag("Alignment")
            Text("Domain").tag("Domain")
        }
        .pickerStyle(.segmented)
        if filterType == "Name" {
            HStack {
                Text("Filter by Letter:")
                Picker("Filter by Letter", selection: $nameFilter) {
                    Text("All").tag("All")
                    ForEach(letters, id: \.self) {
                        Text($0).tag($0)
                    }
                }
            }
        }
        if filterType == "Domain" {
            HStack {
                Text("Filter by Domain:")
                Picker("Filter by Domain", selection: $domainFilter) {
                    Text("All").tag("All")
                    ForEach(data.domains, id: \.self) {
                        Text($0.name).tag($0.name)
                    }
                }
            }
        }
        if filterType == "Alignment" {
            HStack {
                Text("Filter by Alignment:")
                Picker("Filter by Alignment", selection: $alignmentFilter) {
                    Text("All").tag("All")
                    ForEach(fafull.indices, id: \.self) { index in
                        Text(fafull[index]).tag(fa[index])
                    }
                }
            }
        }
        List {
            ForEach(deities.sorted(byKeyPath: "name"), id: \.self) { deity in
                NavigationLink(value: Route.deitySelectionView(deity: deity, chosenFeatures: chosenFeatures)) {
                    HStack {
                        Text("\(deity.name)")
                        Spacer()
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Deities", displayMode: .inline)
        .padding(.bottom)
    }
}
