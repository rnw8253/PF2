//
//  returnWeaponFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/29/23.
//

import Foundation


extension Character {
    func returnWeaponCategoryProf(weaponCategory: String) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Weapon Category" {
                    if prof.name! == weaponCategory {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for prof in effect.armorProficiencies {
                if prof.type == "Weapon Category" {
                    if prof.name! == weaponCategory {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnWeaponGroupProf(weaponGroup: String) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Weapon Group" {
                    if prof.name! == weaponGroup {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for prof in effect.armorProficiencies {
                if prof.type == "Weapon Group" {
                    if prof.name! == weaponGroup {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
    func returnWeaponNameProf(weaponName: String) -> String {
        var profInt = 0
        if currentClass != nil {
            for prof in currentClass!.classProfs {
                if prof.type == "Weapon" {
                    if prof.name! == weaponName {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for prof in effect.armorProficiencies {
                if prof.type == "Weapon" {
                    if prof.name! == weaponName {
                        if convertProfToInt(prof: convertProf(prof.prof)) > profInt {
                            profInt = convertProfToInt(prof: convertProf(prof.prof))
                        }
                    }
                }
            }
        }
        return convertIntToProf(value: profInt)
    }
}
