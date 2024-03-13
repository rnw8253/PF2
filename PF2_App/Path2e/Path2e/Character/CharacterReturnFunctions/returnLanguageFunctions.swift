//
//  returnLanguageFunctions.swift
//  Path2e
//
//  Created by Ryan Weber on 8/4/23.
//

import Foundation

extension Character {
    func returnLearnableLanguages() -> [String] {
        var temp: [String] = []
        if ancestry != nil {
            for lang in ancestry!.bonusLanguages {
                temp.append(lang)
            }
        }
        return temp
    }
    func returnKnownLanguages(excludeRoute: [Route]?) -> [String] {
        var temp: [String] = []
        if ancestry != nil {
            for lang in ancestry!.languages {
                temp.append(lang)
            }
        }
        let effects = getEffects(lvl: nil, excludeRoute: excludeRoute)
        for effect in effects {
            for lang in effect.languages {
                temp.append(lang)
            }
        }
        for lang in initialLanguages {
            temp.append(lang)
        }
        return temp
    }
    func returnKnownLanguagesString(excludeRoute: [Route]?) -> String {
        var langStr = ""
        for lang in returnKnownLanguages(excludeRoute: excludeRoute) {
            if langStr == "" {
                langStr = lang
            } else {
                langStr += ", \(lang)"
            }
        }
        return langStr
    }
}
