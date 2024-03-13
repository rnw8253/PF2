//
//  Alert.swift
//  Path2e
//
//  Created by Ryan Weber on 7/23/23.
//
import Foundation
import SwiftUI

enum MyAlerts: Hashable, Equatable {
    case chooseAlchemicalFormula
    case chooseSignatureSpell
    case chooseXAbilityBoosts(count: Int)
    case chooseXSkills(count: Int)
    case chooseSpells
    case chooseAbilityBoosts
    case chooseAncestry
    case chooseHeritage
    case chooseBackground
    case chooseAlignment
    case chooseClass
    case chooseCharactersName
    case chooseInitialSkills
    case deleteNewCharacter
    case chooseXLanguages(count: Int)
    case repeatLanguages
    case chooseXClassAbilities(count: Int)
    case chooseAncestryFeat
}

func getAlert(myAlert: MyAlerts?) -> Alert {
    switch myAlert {
    case .chooseCharactersName:
        return Alert(title: Text("Select Character's Name"), message: Text("Your new identity deserves a name."), dismissButton: .default(Text("OK")))
    case .chooseAncestry:
        return Alert(title: Text("Select an Ancestry"), message: Text("Choose an ancestry that represents the culture you desend from."), dismissButton: .default(Text("OK")))
    case .chooseHeritage:
        return Alert(title: Text("Select a Heritage"), message: Text("Choose a heritage that reflects the abilities passed down to you from your ancestors."), dismissButton: .default(Text("OK")))
    case .chooseBackground:
        return Alert(title: Text("Select a Background"), message: Text("Choose a background representing your characters past experiences and training."), dismissButton: .default(Text("OK")))
    case .chooseAlignment:
        return Alert(title: Text("Select an Alignment"), message: Text("Choose an alignment indicating your characters morality and ethics."), dismissButton: .default(Text("OK")))
    case .chooseAbilityBoosts:
        return Alert(title: Text("Select Ability Boosts"), message: Text("Choose ability scores that represent your charaters raw talent and potential"), dismissButton: .default(Text("OK")))
    case .chooseClass:
        return Alert(title: Text("Select a Class"), message: Text("Choose a class that defines your character's capabilities."), dismissButton: .default(Text("OK")))
    case let .chooseXSkills(count):
        return Alert(title: Text("Select Skills"), message: Text("Must select \(count) more skill proficiency."), dismissButton: .default(Text("OK")))
    case let .chooseXAbilityBoosts(count):
        return Alert(title: Text("Choose Ability Boosts"), message: Text("Must select \(count) more ability boosts."), dismissButton: .default(Text("OK")))
    case .chooseSpells:
        return Alert(title: Text("Select Spells"), message: Text("Must select all spells."), dismissButton: .default(Text("OK")))
    case .chooseSignatureSpell:
        return Alert(title: Text("Select Signature Spells"), message: Text("Must select a new signature spell."), dismissButton: .default(Text("OK")))
    case .chooseAlchemicalFormula:
        return Alert(title: Text("Select Alchemical Formula"), message: Text("Must select a new alchemical formula."), dismissButton: .default(Text("OK")))
    case let .chooseXLanguages(count):
        return Alert(title: Text("Select Languages"), message: Text("Must select \(count) more languages."), dismissButton: .default(Text("OK")))
    case .chooseInitialSkills:
        return Alert(title: Text("Select Skills"), message: Text("Choose skills that represent your training and experience at performing certain tasks."), dismissButton: .default(Text("OK")))
    case .repeatLanguages:
        return Alert(title: Text("Select Unique Languages"), message: Text("You have chosen a language multiple times, you must select a unqiue language"), dismissButton: .default(Text("OK")))
    case let .chooseXClassAbilities(count):
        return Alert(title: Text("Select All Class Abilities"), message: Text("\(count) class abilities are unselected. You must choose all class abilities. "), dismissButton: .default(Text("OK")))
    case .chooseAncestryFeat:
        return Alert(title: Text("Select Ancestry Feat"), message: Text("You must choose an ancestry feat."), dismissButton: .default(Text("OK")))
    default:
        return Alert(title: Text("No Error Code Given"))
    }
}
