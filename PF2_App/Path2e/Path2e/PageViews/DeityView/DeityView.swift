//
//  DietyDisplayView.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//

import Foundation
import RealmSwift
import SwiftUI

struct DeityView: View {
    var deity: DeityData
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        List {
            Group {

                if deity.nickname != nil {
                    HStack {
                        Text("Other Names")
                        Spacer()
                        Text(deity.nickname!)
                            .foregroundColor(.secondary)
                    }
                }
                HStack {
                    Text("Source")
                    Spacer()
                    Text(deity.contentSrc)
                }
                Section(header: Text("Description")) {
                    Text(deity.descriptions)
                }
                HStack {
                    Text("Category")
                    Spacer()
                    Text(deity.category)
                }
                HStack {
                    Text("Alignment")
                    Spacer()
                    Text(deity.alignment)
                        .foregroundColor(.secondary)
                }
                Section(header: Text("Edict")) {
                    HStack {
                        Text(deity.edicts)
                    }
                }
                Section(header: Text("Anathema")) {
                    HStack {
                        Text(deity.anathema)
                    }
                }
                if deity.areasOfConcern.count > 0 {
                    Section(header: Text("Areas of Concern")) {
                        HStack {
                            Text(deity.areasOfConcern.joined(separator: ", ").capitalized)
                        }
                    }
                }
                if deity.followerAlignments.count > 0 {
                    Section(header: Text("Follower Alignments")) {
                        HStack {
                            Text(deity.followerAlignments.joined(separator: ", ").capitalized)
                        }
                    }
                }
            }
            Section(header: Text("Devotee Benefits")) {
                if deity.divineAbility.count > 0 {
                    HStack {
                        Text("Divine Ability")
                        Spacer()
                        Text(deity.divineAbility.joined(separator: ", ").capitalized)
                            .foregroundColor(.secondary)
                    }
                }
                if deity.divineFont.count > 0 {
                    HStack {
                        Text("Divine Font")
                        Spacer()
                        Text(deity.divineFont.joined(separator: ", ").capitalized)
                            .foregroundColor(.secondary)
                    }
                }
                HStack {
                    Text("Divine Skill")
                    Spacer()
                    Text(deity.divineSkill.capitalized)
                        .foregroundColor(.secondary)
                }
                if deity.favoredWeapon.count > 0 {
                    HStack {
                        Text("Favored Weapon")
                        Spacer()
                        Text(deity.favoredWeapon.joined(separator: ", ").capitalized)
                            .foregroundColor(.secondary)
                    }
                }
            }
            Section(header: Text("Domains")) {
                ForEach(deity.domains, id: \.self) { domain in
                    NavigationLink(value: Route.domainView(domain: data.domains.filter("name ==[c] %@", domain)[0])) {
                        HStack {
                            Text(domain)
                            Spacer()
                        }
                    }
                }
            }
            Section(header: Text("Alternate Domains")) {
                ForEach(deity.alternateDomains, id: \.self) { domain in
                    NavigationLink(value: Route.domainView(domain: data.domains.filter("name ==[c] %@", domain)[0])) {
                        HStack {
                            Text(domain)
                            Spacer()
                        }
                    }
                }
            }
            Section(header: Text("Cleric Spells")) {
                ForEach(deity.clericSpells, id: \.self) { spell in
                    NavigationLink(value: Route.spellView(spell: data.spells.filter("name ==[c] %@", spell.name)[0])) {
                        HStack{
                            Text(spell.name)
                            Spacer()
                            Text("level \(spell.level)")
                        }
                    }
                }
            }
            if deity.minorBoon != "" || deity.moderateBoon != "" || deity.majorBoon != "" || deity.minorCurse != "" || deity.moderateCurse != "" || deity.majorCurse != "" {
                Section(header: Text("Divine Intercession")) {
                    if deity.minorBoon != "" {
                        Text("Minor Boon: \(deity.minorBoon)")
                    }
                    if deity.moderateBoon != "" {
                        Text("Moderate Boon: \(deity.moderateBoon)")
                    }
                    if deity.majorBoon != "" {
                        Text("Major Boon: \(deity.majorBoon)")
                    }
                    if deity.minorCurse != "" {
                        Text("Minor Curse: \(deity.minorCurse)")
                    }
                    if deity.moderateCurse != "" {
                        Text("Moderate Curse: \(deity.moderateCurse)")
                    }
                    if deity.majorCurse != "" {
                        Text("Major Curse: \(deity.majorCurse)")
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(deity.name, displayMode: .inline)
        .padding(.bottom)
    }
}
