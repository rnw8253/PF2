import Foundation
import SwiftUI
import RealmSwift

struct WeaponAndArmorDisplay: View {
    var waa: WeaponAndArmor
    @ObservedObject var chosenFeatures: ChosenFeaturesModel
    @EnvironmentObject var preferences: Preferences
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        if waa.setMightyBulwark == true || waa.giveArmorSpecialization.count > 0 || waa.overrideArmorCheckPenalty != nil || waa.overrideArmorSpeedPenalty != nil || waa.setUnburdenedIron == true || waa.defaultArmorRune.count > 0 || waa.armorProficiencies.count > 0 {
            Section(header: Text("Armor")) {
                if waa.armorProficiencies.count > 0 {
                    ForEach(waa.armorProficiencies, id: \.self) { prof in
                        HStack {
                            Text("\(prof.name!) Armor Proficiency")
                            Spacer()
                            Text(convertProf(prof.prof))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if waa.giveArmorSpecialization.count > 0 {
                    ForEach(waa.giveArmorSpecialization, id: \.self) { armor in
                        HStack {
                            switch armor.type {
                            case "Medium", "Medium_Armor":
                                Text("Medium Armor Category Specialization")
                            case "Heavy_Armor":
                                Text("Heavy Armor Category Specialization")
                            case "NAME":
                                Text("\(armor.value!) Armor Specialization")
                            default:
                                let _ = print("ERROR: Couldn't identify armor specialization")
                                let _ = print(armor.type)
                            }
                            Spacer()
                        }
                    }
                }
                if waa.defaultArmorRune.count > 0 {
                    ForEach(waa.defaultArmorRune, id: \.self) { r in
                        let rune = data.items.where {
                            $0.name.contains(r)
                        }
                        NavigationLink(value: Route.itemView(item: rune[0])) {
                            HStack {
                                Text(rune[0].name)
                                Spacer()
                            }
                        }
                    }
                }
                if waa.setMightyBulwark == true {
                    HStack {
                        Text("Might Bulwark")
                        Spacer()
                    }
                }
                if waa.setUnburdenedIron == true {
                    HStack {
                        Text("Unburdened Iron")
                        Spacer()
                    }
                }
                if waa.overrideArmorCheckPenalty != nil {
                    HStack {
                        Text("Override Armor Check Penalty")
                        Spacer()
                        Text("\(waa.overrideArmorCheckPenalty!)")
                            .foregroundColor(.secondary)
                    }
                }
                if waa.overrideArmorSpeedPenalty != nil {
                    HStack {
                        Text("Override Armor Speed Penalty")
                        Spacer()
                        Text("\(waa.overrideArmorSpeedPenalty!)")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        if waa.giveWeaponFamiliarity.count > 0 || waa.improvisedWeaponNoPenalty == true || waa.giveWeaponCriticalSpecialization.count > 0 || waa.addLevelToUntrainedWeapons == true || waa.giveWeaponSpecialization == true || waa.giveGreaterWeaponSpecialization == true || waa.weaponProficiencies.count > 0 || waa.defaultWeaponRune.count > 0 {
            Section(header: Text("Weapons")) {
                if waa.giveWeaponFamiliarity.count > 0 {
                    ForEach(waa.giveWeaponFamiliarity, id: \.self) { weapon in
                        HStack {
                            Text("\(weapon) Familiarity")
                            Spacer()
                        }
                    }
                }
                if waa.improvisedWeaponNoPenalty == true {
                    HStack {
                        Text("No Penalty for Improvised Weapons")
                    }
                }
                if waa.giveWeaponCriticalSpecialization.count > 0 {
                    ForEach(waa.giveWeaponCriticalSpecialization, id: \.self) { weapon in
                        HStack {
                            switch weapon.type.capitalized {
                            case "Group":
                                Text("\(weapon.value) Weapon Group Specialization")
                            case "Martial_Weapons":
                                Text("Martial Weapon Category Specialization")
                            case "Name", "Weapon":
                                Text("\(weapon.value) Weapon Specialization")
                            case "Prof":
                                Text("\(weapon.value) Weapon Proficiency Specialization")
                            case "Simple_Weapons":
                                Text("Simple Weapon Category Specialization")
                            case "Trait":
                                Text("\(weapon.value) Weapon Trait Specialization")
                            case "Unarmed_Attacks":
                                Text("Unarmed Weapon Category Specialization")
                            default:
                                let _ = print("ERROR: Couldn't identify armor specialization")
                                let _ = print(weapon.type)
                            }
                            Spacer()
                        }
                    }
                }
                if waa.addLevelToUntrainedWeapons == true {
                    HStack {
                        Text("Add Level to Untrained Weapons")
                        Spacer()
                    }
                }
                if waa.giveWeaponSpecialization == true {
                    HStack {
                        Text("Give Weapon Specialization")
                        Spacer()
                    }
                }
                if waa.giveGreaterWeaponSpecialization == true {
                    HStack {
                        Text("Give Greater Weapon Specialization")
                        Spacer()
                    }
                }
                if waa.weaponProficiencies.count > 0 {
                    ForEach(waa.weaponProficiencies, id: \.self) { prof in
                        HStack {
                            switch prof.type {
                            case "Weapon Category":
                                Text("\(prof.name!) Weapon Category Proficiency")
                            case "Weapon Group":
                                Text("\(prof.name!) Weapon Group Proficiency")
                            case "Weapon":
                                Text("\(prof.name!) Weapon Proficiency")
                            case "Trait":
                                Text("\(prof.name!) Item Trait Proficiency")
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
                if waa.defaultWeaponRune.count > 0 {
                    ForEach(waa.defaultWeaponRune, id: \.self) { r in
                        let rune = data.items.where {
                            $0.name.contains(r)
                        }
                        NavigationLink(value: Route.itemView(item: rune[0])) {
                            HStack {
                                Text(rune[0].name)
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        if waa.setTier2Agile == true || waa.onHitDamage != nil || waa.onHitOther != nil || waa.onHitConditional != nil || waa.onCritOther != nil || waa.onCritConditional != nil || waa.setFinesseMeleeDamageAsDex == true || waa.increaseDeificWeaponDamge == true || waa.upgradeUnarmedAttackDice == true ||  waa.giveRageAttack.count > 0 || waa.chooseRageWeapon == true || waa.increaseRageDamage != nil {
            Section(header: Text("Attacks")) {
                if waa.chooseRageWeapon == true {
                    NavigationLink(value: Route.chooseRageWeaponDisplay(chosenFeatures: chosenFeatures)) {
                        HStack {
                            Text(chosenFeatures.rageWeapon?.item == nil ? "Select Weapon" : "Weapon")
                                .foregroundColor(chosenFeatures.rageWeapon?.item == nil ? preferences.unselectedColor :  preferences.selectedColor)
                            Spacer()
                            Text(chosenFeatures.rageWeapon?.item?.name ?? "Unselected")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if waa.increaseRageDamage != nil {
                    HStack {
                        Text("Rage Damage")
                        Spacer()
                        Text(signInt(waa.increaseRageDamage!))
                            .foregroundColor(.secondary)
                    }
                }
                if waa.giveRageAttack.count > 0 {
                    ForEach(waa.giveRageAttack, id: \.self) {a in
                        let attack = data.items.filter("id == %@",a)[0]
                        NavigationLink(value: Route.itemView(item: attack)) {
                            HStack {
                                Text("Rage Attack")
                                Spacer()
                                Text(attack.name)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if waa.upgradeUnarmedAttackDice == true {
                    HStack {
                        Text("Upgrade Unarmed Attack Dice")
                        Spacer()
                    }
                }
                if waa.increaseDeificWeaponDamge == true {
                    HStack {
                        Text("Increase Deific Weapon Damage")
                        Spacer()
                    }
                }
                if waa.setFinesseMeleeDamageAsDex == true {
                    HStack {
                        Text("Use Dexterity for Melee Damage")
                        Spacer()
                    }
                }
                if waa.setTier2Agile {
                    HStack {
                        Text("Upgrade Agile MAP")
                        Spacer()
                    }
                }
                Group {
                    if waa.onHitDamage != nil {
                        HStack {
                            Text("On Hit Damage")
                            Spacer()
                            Text(waa.onHitDamage!)
                                .foregroundColor(.secondary)
                        }
                    }
                    if waa.onHitOther != nil {
                        HStack {
                            Text("On Hit")
                            Spacer()
                            Text(waa.onHitOther!)
                                .foregroundColor(.secondary)
                        }
                    }
                    if waa.onHitConditional != nil {
                        HStack {
                            Text("On Hit")
                            Spacer()
                            Text(waa.onHitConditional!)
                                .foregroundColor(.secondary)
                        }
                    }
                    if waa.onCritOther != nil {
                        HStack {
                            Text("On Crit")
                            Spacer()
                            Text(waa.onCritOther!)
                                .foregroundColor(.secondary)
                        }
                    }
                    if waa.onCritConditional != nil {
                        HStack {
                            Text("On Crit")
                            Spacer()
                            Text(waa.onCritConditional!)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        if waa.chooseAlchemicalFormulas != nil || waa.convertAlchemicalItemDCtoClassDC == true || waa.chooseFieldFormulas != nil || waa.addItemToBag.count > 0 {
            Section(header: Text("Alchemy")) {
                if waa.addItemToBag.count > 0 {
                    ForEach(waa.addItemToBag, id: \.self) { it in
                        let items = data.items.filter("name ==[c] %@",String(it).split(separator: "~")[0])
                        if items.count > 0 {
                            NavigationLink(value: Route.itemView(item: items[0])) {
                                HStack {
                                    Text(String(it).capitalized)
                                    Spacer()
                                }
                            }
                        } else {
                            HStack {
                                Text(String(it).capitalized)
                                Spacer()
                            }
                        }
                    }
                }
                if waa.convertAlchemicalItemDCtoClassDC == true {
                    Text("Conver Alchemical Item DC to Class DC")
                    Spacer()
                }
                if waa.chooseFieldFormulas != nil {
                    ForEach(0...waa.chooseFieldFormulas!.count-1, id: \.self) { index in
                        NavigationLink(value: Route.chooseFieldFormulaListDisplay(type: waa.chooseFieldFormulas!.type, chosenFeatures: chosenFeatures, index: index)) {
                            HStack {
                                Text(chosenFeatures.fieldFormula[index] == nil ? "Select Formula" : "Formula")
                                    .foregroundColor(chosenFeatures.fieldFormula[index] == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                Text(chosenFeatures.fieldFormula[index]?.name ?? "Unselected")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                if waa.chooseAlchemicalFormulas != nil {
                    ForEach(0...waa.chooseAlchemicalFormulas!.count-1, id: \.self) { index in
                        NavigationLink(value: Route.chooseAlchemicalFormulaCategoryListDisplay(level: waa.chooseAlchemicalFormulas!.level, chosenFeatures: chosenFeatures, index: index)) {
                            HStack {
                                Text(chosenFeatures.alchemicalFormula[index] == nil ? "Select Formula" : "Formula")
                                    .foregroundColor(chosenFeatures.alchemicalFormula[index] == nil ? preferences.unselectedColor :  preferences.selectedColor)
                                Spacer()
                                Text(chosenFeatures.alchemicalFormula[index]?.name ?? "Unselected")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }
}


