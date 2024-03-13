//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalWAADisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.increaseRageAttackDamage != nil {
                HStack {
                    Text("Increase Rage Attack Damage")
                    Spacer()
                    Text("\(conditionalChange.increaseRageAttackDamage!)")
                }
            }
            if conditionalChange.increaseRageDamage != nil {
                HStack {
                    Text("Increase Rage Damage")
                    Spacer()
                    Text("\(conditionalChange.increaseRageDamage!)")
                }
            }
            if conditionalChange.increaseRageWeaponDamage != nil {
                HStack {
                    Text("Increase Rage Weapon Damage")
                    Spacer()
                    Text("\(conditionalChange.increaseRageWeaponDamage!)")
                }
            }
            if conditionalChange.tempAttackDamageBonus != nil {
                Text(conditionalChange.tempAttackDamageBonus!)
            }
            if conditionalChange.giveWeaponCriticalSpecialization != nil {
                HStack {
                    switch conditionalChange.giveWeaponCriticalSpecialization!.type.capitalized {
                    case "Group":
                        Text("\(conditionalChange.giveWeaponCriticalSpecialization!.value) Weapon Group Specialization")
                    case "Martial_Weapons":
                        Text("Martial Weapon Category Specialization")
                    case "Name", "Weapon":
                        Text("\(conditionalChange.giveWeaponCriticalSpecialization!.value) Weapon Specialization")
                    case "Prof":
                        Text("\(conditionalChange.giveWeaponCriticalSpecialization!.value) Weapon Proficiency Specialization")
                    case "Simple_Weapons":
                        Text("Simple Weapon Category Specialization")
                    case "Trait":
                        Text("\(conditionalChange.giveWeaponCriticalSpecialization!.value) Weapon Trait Specialization")
                    case "Unarmed_Attacks":
                        Text("Unarmed Weapon Category Specialization")
                    default:
                        let _ = print("ERROR: Couldn't identify armor specialization")
                        let _ = print(conditionalChange.giveWeaponCriticalSpecialization!.type)
                    }
                    Spacer()
                }
            }
            if conditionalChange.giveArmorSpecialization != nil {
                HStack {
                    switch conditionalChange.giveArmorSpecialization!.type {
                    case "Medium", "Medium_Armor":
                        Text("Medium Armor Category Specialization")
                    case "Heavy_Armor":
                        Text("Heavy Armor Category Specialization")
                    case "NAME":
                        Text("\(conditionalChange.giveArmorSpecialization!.value!) Armor Specialization")
                    default:
                        let _ = print("ERROR: Couldn't identify armor specialization")
                        let _ = print(conditionalChange.giveArmorSpecialization!.type)
                    }
                    Spacer()
                }
            }
        }
    }
}

//@Persisted var giveWeaponCriticalSpecialization: WeaponCriticalizationSpecialization? = nil
//@Persisted var giveArmorSpecialization: ArmorSpecialization? = nil
//@Persisted var setMAP: String? = nil
//@Persisted var increaseRageAttackDamage: Int? = nil
//@Persisted var increaseRageDamage: Int? = nil
//@Persisted var upgradeRageAttack: Bool = false
//@Persisted var chooseRageWeapon: Bool = false
//@Persisted var increaseRageWeaponDamage: Int? = nil
//@Persisted var tempAttackDamageBonus: String? = nil


