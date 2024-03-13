//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalSkillDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.elseGiveLore != nil {
                HStack {
                    Text("\(conditionalChange.elseGiveLore!) Lore")
                    Spacer()
                }
            }
        }
    }
}

//@Persisted var chooseLore: Int = 0
//@Persisted var chooseSkill: RealmSwift.List<String>
//@Persisted var elseGiveLore: String? = nil
//@Persisted var elseChooseSkill: String? = nil
//@Persisted var skillIncrease: Int = 0






