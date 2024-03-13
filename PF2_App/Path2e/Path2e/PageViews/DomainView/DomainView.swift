//
//  DomainDisplayView.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//

import SwiftUI
import RealmSwift

struct DomainView: View {
    var domain: DomainData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            HStack {
                Text("Source")
                Spacer()
                Text(domain.contentSrc)
                    .foregroundColor(.secondary)
            }
            Section(header: Text("Domain Spells")) {
                NavigationLink(value: Route.spellView(spell: data.spells.filter("name ==[c] %@", domain.domainSpell)[0])) {
                    HStack {
                        Text("Domain Spell")
                        Spacer()
                        Text(domain.domainSpell)
                            .foregroundColor(.secondary)
                    }
                }
                NavigationLink(value: Route.spellView(spell: data.spells.filter("name ==[c] %@", domain.advancedDomainSpell)[0])) {
                    HStack {
                        Text("Advanced Domain Spell")
                        Spacer()
                        Text(domain.advancedDomainSpell)
                            .foregroundColor(.secondary)
                    }
                }
            }
            if domain.apocryphalDomainSpell != nil || domain.advancedApocryphalDomainSpell != nil {
                Section(header: Text("Apocryphal Domain Spells")) {
                    Text("Not all clerical traditions are taught among the orthodoxy. Some are whispered in secret, passed down from a priest to trusted acolytes or scribed in tomes left behind by splinter factions. Some apocryphal spells are considered heretical and suppressed, but others have fallen out of use or are specific to a region or sect. These apocryphal spells usually rely on more abstract associations between divine power and a certain effect than those seen in orthodox ones.")
                }
                Section(header: Text("")) {
                    if domain.apocryphalDomainSpell != nil {
                        NavigationLink(value: Route.spellView(spell: data.spells.filter("name == %@", domain.apocryphalDomainSpell!)[0])) {
                            HStack {
                                Text("Apocryphal Domain Spell")
                                Spacer()
                                Text(domain.apocryphalDomainSpell!)
                                    .foregroundColor(.secondary)
                            }
                        }
                    } else {
                        HStack {
                            Text("Apocryphal Domain Spell")
                            Spacer()
                            Text("-")
                        }
                    }
                    
                    if domain.advancedApocryphalDomainSpell != nil {
                        NavigationLink(value: Route.spellView(spell: data.spells.filter("name == %@", domain.advancedApocryphalDomainSpell!)[0])) {
                            HStack {
                                Text("Advanced Apocryphal Domain Spell")
                                Spacer()
                                Text(domain.advancedApocryphalDomainSpell!)
                                    .foregroundColor(.secondary)
                            }
                        }
                    } else {
                        HStack {
                            Text("Advanced Apocryphal Domain Spell")
                            Spacer()
                            Text("-")
                        }
                    }
                }
            }
            Section(header: Text("Description")) {
                HStack {
                    Text(domain.descriptions)
                }
            }
            
            Section(header: Text("Deities")) {
                Text(domain.deities.joined(separator: ", ").capitalized)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(domain.name, displayMode: .inline)
        .padding(.bottom)
    }
}
