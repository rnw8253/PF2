//
//  FeatureDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//


import Foundation
import SwiftUI
import RealmSwift

struct FeatureDisplay: View {
    var feature: Feature
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        if feature.giveHeritageEffectAncestry != nil || feature.giveCharacterTrait.count > 0 || feature.giveCharacterTraitCommon == true || feature.giveDragonType != nil {
            Section(header: Text("Traits")) {
                if feature.giveDragonType != nil {
                    HStack {
                        Text("Dragon Type")
                        Spacer()
                        Text(feature.giveDragonType!)
                            .foregroundColor(.secondary)
                    }
                }
                if feature.giveHeritageEffectAncestry != nil {
                    HStack {
                        Text("Gain Heritage Effect")
                        Spacer()
                        Text(feature.giveHeritageEffectAncestry!)
                            .foregroundColor(.secondary)
                    }
                }
                if feature.giveCharacterTrait.count > 0 {
                    ForEach(feature.giveCharacterTrait, id: \.self) { t in
                        let trait = data.traits.filter("name ==[c] %@",t)
                        if trait.count > 0 {
                            NavigationLink(value: Route.traitView(trait: trait[0])) {
                                HStack {
                                    Text("Give Trait")
                                    Spacer()
                                    Text(t)
                                        .foregroundColor(.secondary)
                                }
                            }
                        } else {
                            HStack {
                                Text("Give Trait")
                                Spacer()
                                Text(t)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if feature.giveCharacterTraitCommon == true {
                    Picker(selection: $chosenFeatures.commonAncestryTrait) {
                        Text("Dwarf").tag("Dwarf")
                        Text("Elf").tag("Elf")
                        Text("Gnome").tag("Gnome")
                        Text("Goblin").tag("Goblin")
                        Text("Halfing").tag("Halfling")
                        Text("Human").tag("Human")
                        Text("Unselected").tag("")
                    } label: {
                        Text(chosenFeatures.commonAncestryTrait == "" ? "Select Ancestry Trait" : "Ancestry Trait")
                            .foregroundColor(chosenFeatures.commonAncestryTrait == "" ? preferences.unselectedColor :  preferences.selectedColor)
                    }
                }
            }
        }
        if feature.giveSpeed.count > 0 || feature.giveSense.count > 0 || feature.givePhysicalFeature.count > 0 || feature.giveClassFeature.count > 0 || feature.giveResistance.count > 0 || feature.giveWeakness.count > 0 || feature.setKeyAbility.count > 0 || feature.giveApexAbilityScore.count > 0 || feature.giveAbilityBoost > 0 || feature.setSize != nil {
            Section(header: Text("Character Features")) {
                if feature.giveAbilityBoost > 0 {
                    NavigationLink(value: Route.abilityBoostSelectionView(count: feature.giveAbilityBoost, options: nil, boosts: nil, flaw: nil, chosenAbilityBoosts: chosenFeatures.abilityBoost)) {
                        HStack {
                            Text(chosenFeatures.abilityBoost.returnAbilityBoosts() == "Unselected" ? "Select Ability Boosts" : "Ability Boosts")
                                .foregroundColor(chosenFeatures.abilityBoost.returnAbilityBoosts() == "Unselected" ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.abilityBoost.returnAbilityBoosts())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if feature.setSize != nil {
                    HStack {
                        Text("Set Size")
                        Spacer()
                        Text(feature.setSize!)
                            .foregroundColor(.secondary)
                    }
                }
                if feature.giveApexAbilityScore.count > 0 {
                    ForEach(feature.giveApexAbilityScore, id: \.self) { ability in
                        HStack {
                            Text("Apex Ability Score")
                            Spacer()
                            Text(ability)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if feature.setKeyAbility.count > 0 {
                    Picker(selection: $chosenFeatures.keyAbility) {
                        ForEach(feature.setKeyAbility, id: \.self) { ability in
                            Text(ability).tag(ability)
                        }
                        Text("Unselected").tag("")
                    } label: {
                        Text(chosenFeatures.keyAbility == "" ? "Select Key Ability" : "Key Ability")
                            .foregroundColor(chosenFeatures.keyAbility == "" ? preferences.unselectedColor :  preferences.selectedColor)
                    }
                }
                if feature.giveWeakness.count > 0 {
                    ForEach(feature.giveWeakness, id: \.self) { weakness in
                        HStack {
                            Text("\(weakness.type) Weakness")
                            Spacer()
                            if weakness.value != nil {
                                Text(signInt(weakness.value!))
                                    .foregroundColor(.secondary)
                            }
                            if weakness.halfLevel == true {
                                Text("Half Character Level")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if feature.giveResistance.count > 0 {
                    ForEach(feature.giveResistance, id: \.self) { resistance in
                        HStack {
                            Text("\(resistance.type) Resistance")
                            Spacer()
                            if resistance.value != nil {
                                Text(signInt(resistance.value!))
                                    .foregroundColor(.secondary)
                            }
                            if resistance.halfLevel == true {
                                Text("Half Character Level")
                                    .foregroundColor(.secondary)
                            }
                            if resistance.level == true {
                                Text("Character Level")
                                    .foregroundColor(.secondary)
                            }
                            if resistance.addConMod == true {
                                Text("Add Con Modifier")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if feature.giveClassFeature.count > 0 {
                    ForEach(Array(feature.giveClassFeature.enumerated()), id: \.element) { index, classFeature in
                        let classAbility = data.classAbilities.filter("name ==[c] %@", classFeature)[0]
                        if classAbility.selectType == "SELECTOR" {
                            NavigationLink(value: Route.classFeatureSelectorListDisplay(selectorID: classAbility.id, chosenFeatures: chosenFeatures, index: index)) {
                                HStack {
                                    Text(chosenFeatures.classAbilityFeatures[index]?.classAbility == nil ? "Select Class Feature" : "Class Feature")
                                        .foregroundColor(chosenFeatures.classAbilityFeatures[index]?.classAbility == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                    Spacer()
                                    Text(chosenFeatures.classAbilityFeatures[index]?.classAbility?.name ?? "Unselected")
                                        .foregroundColor(.secondary)
                                }
                            }
                        } else {
                            NavigationLink(value: Route.classFeatureSelectionDisplay(classAbility: classAbility, chosenFeatures: chosenFeatures, index: index, screenPop: 1)) {
                                HStack {
                                    Text( chosenFeatures.classAbilityFeatures[index]?.classAbility == nil ? "Select Physical Feature" : "Physical Feature")
                                        .foregroundColor(chosenFeatures.classAbilityFeatures[index]?.classAbility == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                    Spacer()
                                    Text(chosenFeatures.classAbilityFeatures[index]?.classAbility?.name ?? "Unselected")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                Group {
                    if feature.givePhysicalFeature.count > 0 {
                        ForEach(feature.givePhysicalFeature, id: \.self) { pf in
                            NavigationLink(value: Route.itemView(item: data.items.filter("name == %@",pf)[0])) {
                                HStack {
                                    Text("Physical Feature")
                                    Spacer()
                                    Text(pf)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                if feature.giveSense.count > 0 {
                    ForEach(feature.giveSense, id: \.self) { sense in
                        HStack {
                            Text(sense)
                            Spacer()
                        }
                    }
                }
                if feature.giveSpeed.count > 0 {
                    ForEach(feature.giveSpeed, id: \.self) { speed in
                        HStack {
                            Text(speed.type)
                            Spacer()
                            if speed.value != nil {
                                Text("\(speed.value!)")
                                    .foregroundColor(.secondary)
                            }
                            if speed.landSpeed == true {
                                Text("Land Speed")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
        if feature.proficiencies.count > 0 {
            Section(header: Text("Proficiencies")) {
                if feature.proficiencies.count > 0 {
                    ForEach(feature.proficiencies, id: \.self) { prof in
                        HStack {
                            switch prof.type {
                            case "Perception":
                                Text("Perception Proficiency")
                            case "Class DC":
                                Text("Class DC Proficiency")
                            case "Save":
                                Text("\(prof.name!) Save Proficiency")
                            default:
                                let _ = print("ERROR: Couldn't identify proficiency")
                                let _ = print(prof)
                            }
                            Spacer()
                            Text(convertProf(prof.prof))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        if feature.giveLanguage.count > 0 || feature.chooseLang > 0 {
            Section(header: Text("Languages")) {
                if feature.giveLanguage.count > 0 {
                    ForEach(feature.giveLanguage, id: \.self) { lang in
                        HStack {
                            Text("Language")
                            Spacer()
                            Text(lang.capitalized)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if feature.chooseLang > 0 {
                    ForEach(0...feature.chooseLang-1, id: \.self) { ind in
                        Picker(selection: $chosenFeatures.languages[ind]) {
                            ForEach(realmManager.character.returnLearnableLanguages(), id: \.self) { lang in
                                Text(lang).tag(lang)
                            }
                            Text("Unselected").tag("")
                        } label: {
                            Text(chosenFeatures.languages[ind] == "" ? "Select Language" : "Langauge")
                                .foregroundColor(chosenFeatures.languages[ind] == "" ? preferences.unselectedColor :  preferences.selectedColor)
                        }
                    }
                }
            }
        }
        if feature.giveAlchemistProgression == true || feature.advancedAlchemy != nil || feature.giveCondition != nil || feature.giveRageCondition != nil {
            if feature.giveRageCondition != nil {
                NavigationLink(value: Route.conditionView(condition: data.conditions.filter("name == %@", feature.giveRageCondition!.name)[0])) {
                    HStack {
                        Text("\(feature.giveRageCondition!.name)")
                        if feature.giveRageCondition!.value != nil {
                            Text("\(feature.giveRageCondition!.value!)")
                        }
                        Spacer()
                    }
                }
            }
            if feature.giveCondition != nil {
                Section(header: Text("Give Condition")) {
                    NavigationLink(value: Route.conditionView(condition: data.conditions.filter("name == %@", feature.giveCondition!.name)[0])) {
                        HStack {
                            Text("\(feature.giveCondition!.name)")
                            Spacer()
                            if feature.giveCondition!.value != nil {
                                Text("\(feature.giveCondition!.value!)")
                            }
                        }
                    }
                }
            }
            if feature.giveAlchemistProgression == true {
                HStack {
                    Text("Alchemist Progression")
                    Spacer()
                }
            }
            if feature.advancedAlchemy != nil {
                HStack {
                    Text("Advanced Alchemy")
                    Spacer()
                }
            }
        }
        if feature.giveDomain != nil || feature.giveDomainAdvancement != nil || feature.giveDivineFont != nil || feature.chooseDeityType != nil {
            Section(header: Text("Deities and Domains")) {
                if feature.giveDivineFont != nil {
                    HStack {
                        Text(feature.giveDivineFont!)
                        Spacer()
                    }
                }
                if feature.chooseDeityType != nil {
                    NavigationLink(value: Route.deityListDisplay(type: feature.chooseDeityType!, chosenFeatures: chosenFeatures)) {
                        HStack {
                            Text(chosenFeatures.deity == nil ? "Select Deity" : "Deity")
                                .foregroundColor(chosenFeatures.deity == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.deity?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if feature.giveDomain != nil {
                    NavigationLink(value: Route.domainListDisplay(giveDomain: feature.giveDomain!, chosenFeatures: chosenFeatures)) {
                        HStack {
                            Text(chosenFeatures.domain == nil ? "Select Domain" : "Domain")
                                .foregroundColor(chosenFeatures.domain == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.domain?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if feature.giveDomainAdvancement != nil {
                    NavigationLink(value: Route.advancedDomainListDisplay(chosenFeatures: chosenFeatures)) {
                        HStack {
                            Text(chosenFeatures.advancedDomain == nil ? "Select Advanced Domain" : "Advanced Domain")
                                .foregroundColor(chosenFeatures.advancedDomain == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.advancedDomain?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

//    @Persisted var giveSCFS: String?


