//
//  ConditionalOtherDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 10/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalOtherDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in

        }
    }
}
    

//@Persisted var addText: String? = nil
//@Persisted var setVariable: SetVariable? = nil
//@Persisted var elseSetVariable: SetVariable? = nil

