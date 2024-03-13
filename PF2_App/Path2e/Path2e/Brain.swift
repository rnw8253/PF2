//
//  Brain.swift
//  Path2e
//
//  Created by Ryan Weber on 7/18/23.
//

import Foundation
import RealmSwift

func signInt(_ num: Int) -> String {
    if num > 0 {
        return "+\(num)"
    } else if num < 0 {
        return "\(num)"
    } else {
        return "0"
    }
}
func returnSavingThrow() -> [String] {
    return ["Fortitude","Reflex","Will"]
}
func returnAbilityList() -> [String] {
    return ["Strength","Dexterity","Constitution","Intelligence","Charisma","Wisdom"]
}
func convertAbility(_ ability: String) -> String {
    switch ability.capitalized {
    case "Str":
        return "Strength"
    case "Dex":
        return "Dexterity"
    case "Con":
        return "Constitution"
    case "Cha":
        return "Charisma"
    case "Int":
        return "Intelligence"
    case "Wis":
        return "Wisdom"
    default:
        return "Error"
    }
}
func convertProf(_ prof: String) -> String {
    switch prof {
    case "U", " U", "Untrained":
        return "Untrained"
    case "T", " T", "Trained":
        return "Trained"
    case "E", " E", "Expert":
        return "Expert"
    case "M", " M", "Master":
        return "Master"
    case "L", " L", "Legendary":
        return "Legendary"
    default:
        return "ERROR: Cannot Determine Proficiency"
    }
}

func returnSkillModType(skill: String) -> String {
    switch skill {
    case "Acrobatics":
        return "Dexterity"
    case "Arcana":
        return "Intelligence"
    case "Athletics":
        return "Strength"
    case "Crafting":
        return "Intelligence"
    case "Deception":
        return "Charisma"
    case "Diplomacy":
        return "Charisma"
    case "Intimidation":
        return "Charisma"
    case "Medicine":
        return "Wisdom"
    case "Nature":
        return "Wisdom"
    case "Occultism":
        return "Intelligence"
    case "Performance":
        return "Charisma"
    case "Religion":
        return "Wisdom"
    case "Society":
        return "Intelligence"
    case "Stealth":
        return "Dexterity"
    case "Survival":
        return "Wisdom"
    case "Thievery":
        return "Dexterity"
    default:
        return "Intelligence"
    }
}

func returnSkillList() -> [String] {
    return ["Acrobatics","Arcana","Athletics","Crafting","Deception","Diplomacy","Intimidation","Medicine","Nature","Occultism","Performance","Religion","Society","Stealth","Survival","Theivery"]
}

func returnAbilityScoreList() -> [String] {
    return ["Strength","Dexterity","Constitution","Wisdom","Intelligence","Charisma"]
}

func calcProficiency(_ traitProf: String, _ level: Int, _ useLevel: Bool) -> Int {
    switch traitProf {
    case "Untrained":
        if useLevel {
            return level
        } else {
            return 0
        }
    case "Trained":
        return 2+level
    case "Expert":
        return 4+level
    case "Master":
        return 6+level
    case "Legendary":
        return 8+level
    default:
        let _ = print("Unrecognized Proficiency")
        return 0
    }
}

func returnProfValue(prof: String) -> Int {
    return calcProficiency(prof, 1, false)
}

func convertProfToInt(prof: String) -> Int {
    switch prof {
    case "Trained","T":
        return 1
    case "Expert","E":
        return 2
    case "Master","M":
        return 3
    case "Legendary","L":
        return 4
    default:
        return 0
    }
}
func convertIntToProf(value: Int) -> String {
    switch value {
    case 1:
        return "Trained"
    case 2:
        return "Expert"
    case 3:
        return "Master"
    case 4:
        return "Legendary"
    default:
        return "Untrained"
    }
}

func returnMaxSkillInt(level: Int) -> Int {
    if level >= 15 {
        return 4
    } else if level >= 7 {
        return 3
    } else {
        return 2
    }
}

func convertToStringList(names: RealmSwift.List<String>) -> [String]? {
    var newList: [String] = []
    for name in names {
        newList.append(String(name))
    }
    return newList
}


func chooseNewProf(_ currentProf: String, _ newProf: String) -> Bool {
    switch newProf {
    case "Trained":
        if currentProf == "Untrained" {
            return false
        } else {
            return true
        }
    case "Expert":
        if currentProf == "Untrained" || currentProf == "Trained" {
            return false
        } else {
            return true
        }
    case "Master":
        if currentProf == "Untrained" || currentProf == "Trained" || currentProf == "Expert" {
            return false
        } else {
            return true
        }
    case "Legendary":
        if currentProf == "Untrained" || currentProf == "Trained" || currentProf == "Expert" || currentProf == "Master" {
            return false
        } else {
            return true
        }
    default:
        return false
    }
}

func compareProf(_ currentProf: String, _ newProf: String) -> String {
    switch currentProf {
    case "Untrained":
        return newProf
    case "Trained":
        if newProf != "Untrained" {
            return newProf
        } else {
            return currentProf
        }
    case "Expert":
        if newProf == "Expert" || newProf == "Master" || newProf == "Legendary" {
            return newProf
        } else {
            return currentProf
        }
    case "Master":
        if newProf == "Legendary" {
            return newProf
        } else {
            return currentProf
        }
    default:
        return currentProf
    }
}

func determineMod(_ valScore: Int) -> Int {
    let val = (Float(valScore)-10.0)/2.0
    return Int(val.rounded(.towardZero))
}

func returnCommonLanguages() -> [String] {
    return ["Draconic","Dwarven","Elven","Gnomish","Goblin","Halfling","Jotun","Orcish","Sylvan","Undercommon"]
}
func returnUncommonLanguages() -> [String] {
    return ["Abyssal","Aklo","Aquan","Auran","Celestial","Gnoll","Ignan","Infernal","Necril","Shadowtongue","Terran"]
}

func compareProf(currentProf: String, newProf: String) -> String {
    switch currentProf {
    case "Untrained":
        return newProf
    case "Trained":
        if newProf != "Untrained" {
            return newProf
        } else {
            return currentProf
        }
    case "Expert":
        if newProf == "Expert" || newProf == "Master" || newProf == "Legendary" {
            return newProf
        } else {
            return currentProf
        }
    case "Master":
        if newProf == "Legendary" {
            return newProf
        } else {
            return currentProf
        }
    default:
        return currentProf
    }
}

func checkIfProfEqualOrHigher(characterProf: String, checkProf: String) -> Bool {
    switch checkProf {
    case "Untrained":
        return true
    case "Trained":
        if characterProf != "Untrained" {
            return true
        } else {
            return false
        }
    case "Expert":
        if characterProf == "Untrained" || characterProf == "Trained" {
            return false
        } else {
            return true
        }
    case "Master":
        if characterProf == "Master" || characterProf == "Legendary" {
            return true
        } else {
            return false
        }
    case "Legendary":
        if characterProf != "Legendary" {
            return false
        } else {
            return true
        }
    default:
        return false
    }
}
func calculateMoney(cp: Int) -> String {
    let gp: Int = Int(cp / 100)
    let new_cp = cp - gp*100
    let sp: Int = Int(new_cp / 10)
    let final_cp: Int = new_cp - sp*10
    var output = ""
    if gp != 0 {
        output += "\(gp) gp"
    }
    if sp != 0 {
        if output != "" {
            output += " "
        }
        output += "\(sp) sp"
    }
    if final_cp != 0 {
        if output != "" {
            output += " "
        }
        output += "\(final_cp) cp"
    }
    return output
}


func checkConditionForChoice(conditionalChange: ConditionalChanges) -> Bool {
    if conditionalChange.chooseSpell != nil || conditionalChange.setVariable != nil || conditionalChange.skillIncrease != 0 || conditionalChange.chooseFeat != nil || conditionalChange.chooseLanguage != 0 || conditionalChange.chooseLore != 0 || conditionalChange.chooseSkill != nil || conditionalChange.chooseSkillFromList != nil || (conditionalChange.chooseFeatFromList != nil) || conditionalChange.chooseRageWeapon != false || conditionalChange.elseChooseSkill != nil || conditionalChange.elseChooseFeatFromList != nil || conditionalChange.setVariable != nil || conditionalChange.elseChooseSkillFromList != nil {
        return true
    } else {
        return false
    }
}


func returnConditionalHeader(conditionalChange: ConditionalChanges) -> String {
    var condStr = "If"
    if conditionalChange.hasLevelGreaterThan != nil {
        if condStr == "If" {
            condStr += " character level >= \(conditionalChange.hasLevelGreaterThan!)"
        } else {
            condStr += " and character level >= \(conditionalChange.hasLevelGreaterThan!)"
        }
    }
    if conditionalChange.hasLevelLessThan != nil {
        if condStr == "If" {
            condStr += " character level <= \(conditionalChange.hasLevelLessThan!)"
        } else {
            condStr += " and character level <= \(conditionalChange.hasLevelLessThan!)"
        }
    }
    if conditionalChange.hasLevel != nil {
        if condStr == "If " {
            condStr += " character level = \(conditionalChange.hasLevel!)"
        } else {
            condStr += " and character level = \(conditionalChange.hasLevel!)"
        }
    }
    if conditionalChange.hasClassAbility.count > 0 {
        for ability in conditionalChange.hasClassAbility {
            if condStr == "If" {
                condStr += " has \(ability)"
            } else {
                condStr += " and has \(ability)"
            }
        }
    }
    if conditionalChange.doesNothaveClassAbility.count > 0 {
        for ability in conditionalChange.doesNothaveClassAbility {
            if condStr == "If" {
                condStr += " does not have \(ability)"
            } else {
                condStr += " and does not have \(ability)"
            }
        }
    }
    if conditionalChange.hasFeat.count > 0 {
        for feat in conditionalChange.hasFeat {
            if condStr == "If" {
                condStr += " has \(feat)"
            } else {
                condStr += " and has \(feat)"
            }
        }
    }
    if conditionalChange.doesNotHaveFeat.count > 0 {
        for feat in conditionalChange.doesNotHaveFeat {
            if condStr == "If" {
                condStr += " does not have \(feat)"
            } else {
                condStr += " and does not have \(feat)"
            }
        }
    }
    if conditionalChange.hasHeritage.count > 0 {
        for heritage in conditionalChange.hasHeritage {
            if condStr == "If" {
                condStr += " has \(heritage) Heritage"
            } else {
                condStr += " and has \(heritage) Heritage"
            }
        }
    }
    if conditionalChange.hasProf.count > 0 {
        for prof in conditionalChange.hasProf {
            if condStr == "If" {
                if prof.name != nil {
                    condStr += " \(convertProf(prof.prof)) in \(prof.name!)"
                } else {
                    condStr += " \(convertProf(prof.prof)) in \(prof.type)"
                }
            } else {
                if prof.name != nil {
                    condStr += " and \(convertProf(prof.prof)) in \(prof.name!)"
                } else {
                    condStr += " and \(convertProf(prof.prof)) in \(prof.type)"
                }
            }
        }
    }
    if conditionalChange.hasProfOrHigher.count > 0 {
        for prof in conditionalChange.hasProfOrHigher {
            if condStr == "If" {
                if prof.name != nil {
                    condStr += " \(convertProf(prof.prof)) in \(prof.name!)"
                } else {
                    condStr += " \(convertProf(prof.prof)) in \(prof.type)"
                }
            } else {
                if prof.name != nil {
                    condStr += " and \(convertProf(prof.prof)) in \(prof.name!)"
                } else {
                    condStr += " and \(convertProf(prof.prof)) in \(prof.type)"
                }
            }
        }
    }
    if conditionalChange.hasLowLightVision == true {
        if condStr == "If" {
            condStr += " has low-light vision"
        } else {
            condStr += " and has low-light vision"
        }
    }
    if conditionalChange.isUnarmored == true {
        if condStr == "If" {
            condStr += " is Unarmored"
        } else {
            condStr += " and is Unarmed"
        }
    }
    if conditionalChange.inRage == true {
        if condStr == "If" {
            condStr += " is Raging"
        } else {
            condStr += " and is Raging"
        }
    }
    if conditionalChange.inOverdrive == true {
        if condStr == "If" {
            condStr += " is in Overdrive"
        } else {
            condStr += " and is in Overdrive"
        }
    }
    if conditionalChange.doesNotHaveFocusPoint == true {
        if condStr == "If" {
            condStr += " has Focus Point"
        } else {
            condStr += " and has Focus Point"
        }
    }
    return condStr
}

func determineContainer(route: [Route]) -> ([String], [ContainerType]) {
    var name: [String] = []
    var type: [ContainerType] = []

    for path in route.reversed() {
        switch path.type {
        case .background, .feat, .classAbility, .ancestry, .ancestryFeat, .currentClass, .heritage, .versatileHeritage, .physicalFeature:
            name.append(path.name)
            type.append(path.type)
        default:
            continue
        }
    }
    return (name, type)
}


func returnWeaponCriticalSpecializationEffect(weaponGroup: String) -> String {
    switch weaponGroup {
    case "Axe":
        return "Choose one creature adjacent to the initial target and within reach. If its AC is lower than your attack roll result for the critical hit, you deal damage to that creature equal to the result of the weapon damage die you rolled (including extra dice for its striking rune, if any). This amount isn't doubled, and no bonuses or other additional dice apply to this damage."
    case "Bomb":
        return "Increase the radius of the bomb's splash damage (if any) to 10 feet."
    case "Bow":
        return "If the target of the critical hit is adjacent to a surface, it gets stuck to that surface by the missile. The target is immobilized and must spend an Interact action to attempt a DC 10 Athletics check to pull the missile free; it can't move from its space until it succeeds. The creature doesn't become stuck if it is incorporeal, is liquid (like a water elemental or some oozes), or could otherwise escape without effort."
    case "Brawling":
        return "The target must succeed at a Fortitude save against your class DC or be slowed 1 until the end of your next turn."
    case "Club":
        return "You knock the target away from you up to 10 feet (you choose the distance). This is forced movement."
    case "Dart":
        return "The target takes 1d6 persistent bleed damage. You gain an item bonus to this bleed damage equal to the weapon's item bonus to attack rolls."
    case "Firearm":
        return "The target must succeed at a Fortitude save against your class DC or be stunned 1."
    case "Flail":
        return "The target is knocked prone."
    case "Hammer":
        return "The target is knocked prone."
    case "Knife":
        return "The target takes 1d6 persistent bleed damage. You gain an item bonus to this bleed damage equal to the weapon's item bonus to attack rolls."
    case "Pick":
        return "The weapon viciously pierces the target, who takes 2 additional damage per weapon damage die."
    case "Polearm":
        return "The target is moved 5 feet in a direction of your choice. This is forced movement."
    case "Shield":
        return "You knock the target back from you 5 feet. This is forced movement."
    case "Sling":
        return "The target must succeed at a Fortitude save against your class DC or be stunned 1."
    case "Spear":
        return "The weapon pierces the target, weakening its attacks. The target is clumsy 1 until the start of your next turn."
    case "Sword":
        return "The target is made off-balance by your attack, becoming flat-footed until the start of your next turn."
    default:
        return "Error: Type does not exist"
    }
}
