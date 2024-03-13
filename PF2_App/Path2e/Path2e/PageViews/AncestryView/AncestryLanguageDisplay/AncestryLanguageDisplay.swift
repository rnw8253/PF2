//
//  AncestryStatLanguageDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestryLanguageDisplay: View {
    let ancestry: AncestryData
    var body: some View {
        if ancestry.languages.count > 0 {
            Section(header: Text("Languages")) {
                ForEach(ancestry.languages, id: \.self) { lang in
                    NavigationLink(value: Route.languageView(language: lang)) {
                        HStack {
                            Text(lang.name)
                        }
                    }
                }
            }
        }
        if ancestry.bonusLanguages.count > 0 {
            Section(header: Text("Additional Languages")) {
                ForEach(ancestry.bonusLanguages, id: \.self) { lang in
                    NavigationLink(value: Route.languageView(language: lang)) {
                        HStack {
                            Text(lang.name.capitalized)
                        }
                    }
                }
            }
        }
    }
}
