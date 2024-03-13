//
//  returnHealthFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/25/23.
//

import Foundation

extension Character {
    func returnMaxHealthModificationBonus() -> Int {
        var hp: Int = 0
        for effect in getEffects(lvl: nil, excludeRoute: nil) {
            for mod in effect.modification {
                if mod.category == "Max Health" {
                    print(mod)
                    if mod.value != nil {
                        hp += mod.value!
                    }
                    if mod.level {
                        hp += level
                    }
                    
                }
                
            }
        }
        return hp
    }
}
