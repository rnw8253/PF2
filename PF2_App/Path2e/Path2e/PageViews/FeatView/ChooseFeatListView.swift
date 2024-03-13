//
//  ChooseFeatListDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/19/23.
//

import Foundation
import RealmSwift
import SwiftUI



struct ChooseFeatListDisplay: View {
    let chooseFeat: ChooseFeat
    @ObservedObject var chosenFeat: ChosenFeatModel
    @State var classFilter: String = "Class"
    @State var generalfilter: String = "General"
    @State var skillFilter: String = "All"
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    var feats: Results<FeatData> {
        var allFeats = data.feats.where {
            $0.level >= 1
        }
        if chooseFeat.level != nil {
            allFeats = allFeats.where {
                $0.level <= chooseFeat.level!
            }
        } else if chooseFeat.currentLevel == true {
            allFeats = allFeats.where {
                $0.level <= realmManager.character.level
            }
        } else if chooseFeat.halfLevel == true {
            allFeats = allFeats.where {
                $0.level <= realmManager.character.halfLevel
            }
        }
        switch chooseFeat.type {
        case "Ancestry":
            return allFeats.where {
                $0.traits.containsAny(in: realmManager.character.returnAncestryHeritageTraitIDs(excludeRoute: appState.path))
            }
        case "Archetype":
            return allFeats.where {
                $0.traits.contains(580)
            }
        case "Class":
            switch classFilter {
            case "Class":
                return allFeats.where {
                    $0.traits.containsAny(in: realmManager.character.returnClassTraitIDs())
                }
            case "Dedication":
                return allFeats.where {
                    $0.traits.containsAny(in: realmManager.character.returnArchetypeTraitIDs())
                }
            case "New Dedications":
                return allFeats.where {
                    $0.traits.contains(580)
                }
            default:
                return allFeats
            }
        case "General":
            switch generalfilter {
            case "General":
                return allFeats.where {
                    ($0.traits.contains(8)) && !($0.traits.contains(9))
                }
            case "Skill":
                switch skillFilter {
                case "Acrobatics":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Acrobatics")) }
                case "Arcana":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Arcana")) }
                case "Athletics":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Athletics")) }
                case "Crafting":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Crafting")) }
                case "Deception":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Deception")) }
                case "Diplomacy":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Diplomacy")) }
                case "Intimidation":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Intimidation")) }
                case "Medicine":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Medicine")) }
                case "Nature":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Nature")) }
                case "Occultism":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Occultism")) }
                case "Performance":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Performance")) }
                case "Religion":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Religion")) }
                case "Society":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Society")) }
                case "Stealth":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Stealth")) }
                case "Survival":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Survival")) }
                case "Thievery":
                    return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Thievery")) }
                case "All":
                    return allFeats.where {  $0.traits.contains(9) }
                default:
                    return allFeats.where {  $0.traits.contains(9) }
                }
            case "All":
                return allFeats.where {
                    $0.traits.containsAny(in: [8,9])
                }
            default:
                return allFeats
            }
        case "Other Class":
            let temp = chooseFeat.className!.split(separator: ",")
            var newFeats = allFeats
            for t in temp {
                let trait = data.traits.filter("name == %@", String(t).capitalized)[0]
                newFeats = newFeats.where {
                    $0.traits.contains(trait.id)
                }
            }
            return newFeats
        case "Skill":
            switch skillFilter {
            case "Acrobatics":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Acrobatics")) }
            case "Arcana":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Arcana")) }
            case "Athletics":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Athletics")) }
            case "Crafting":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Crafting")) }
            case "Deception":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Deception")) }
            case "Diplomacy":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Diplomacy")) }
            case "Intimidation":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Intimidation")) }
            case "Medicine":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Medicine")) }
            case "Nature":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Nature")) }
            case "Occultism":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Occultism")) }
            case "Performance":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Performance")) }
            case "Religion":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Religion")) }
            case "Society":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Society")) }
            case "Stealth":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Stealth")) }
            case "Survival":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Survival")) }
            case "Thievery":
                return allFeats.where { ($0.traits.contains(9)) && ($0.prerequisites.contains("Thievery")) }
            case "All":
                return allFeats.where {  $0.traits.contains(9) }
            default:
                return allFeats.where {  $0.traits.contains(9) }
            }
        default:
            return allFeats
        }
    }
    var body: some View {
        VStack {
            if chooseFeat.type == "Class" {
                Picker("Sort Class Feat List", selection: $classFilter) {
                    Text("Class").tag("Class")
                    Text("Dedication").tag("Dedication")
                    Text("New Dedications").tag("New Dedications")
                }
                .pickerStyle(.segmented)
            }
            if chooseFeat.type == "General" {
                Picker("Sort General Feat List", selection: $generalfilter) {
                    Text("General").tag("General")
                    Text("Skill").tag("Skill")
                    Text("All").tag("All")
                }
                .pickerStyle(.segmented)
                
                if generalfilter == "Skill" {
                    HStack {
                        Text("Filter By Skill:")
                        Picker("Filter By Skill", selection: $skillFilter) {
                            Text("All").tag("All")
                            ForEach(returnSkillList(), id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    }
                }
            }
            if chooseFeat.type == "Skill" {
                HStack {
                    Text("Filter By Skill:")
                    Picker("Filter By Skill", selection: $skillFilter) {
                        Text("All").tag("All")
                        ForEach(returnSkillList(), id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                }
            }
            List {
                let levelList = [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0]
                ForEach(levelList, id: \.self) { level in
                    let subFeats = feats.filter("level == %@", level)
                    if subFeats.count > 0 {
                        Section(header: Text("Level \(level)")) {
                            ForEach(subFeats.sorted(byKeyPath: "name"), id: \.self) { f in
                                NavigationLink(value: Route.featSelectionView(feat: f, chosenFeat: chosenFeat, popValue: 2)) {
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
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Feats", displayMode: .inline)
            .padding(.bottom)
        }
    }
}
