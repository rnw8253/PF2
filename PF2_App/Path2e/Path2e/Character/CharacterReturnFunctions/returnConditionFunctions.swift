//
//  returnConditionFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 11/21/23.
//

import Foundation

extension Character {
    func returnConditionValue(condition: String) -> Int {
        for cond in conditions {
            if cond.name == condition {
                return cond.currentValue
            }
        }
        return 0
    }
    func returnConditionIsActive(condition: String) -> Bool {
        for cond in conditions {
            if cond.name == condition {
                return cond.isActive
            }
        }
        return false
    }
    func returnMaxDyingConditon() -> Int {
        return 4
    }
    func returnRecoveryCheckDC() -> Int {
        return 10 + returnConditionValue(condition: "Dying")
    }
}
