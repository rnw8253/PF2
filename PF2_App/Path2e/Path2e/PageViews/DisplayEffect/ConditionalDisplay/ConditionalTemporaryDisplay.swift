//
//  ConditionalDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 8/24/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalTemporaryDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.tempSaveFort != nil {
                HStack {
                    Text(conditionalChange.tempSaveFort!)
                }
            }
            if conditionalChange.tempSaveReflex != nil {
                HStack {
                    Text(conditionalChange.tempSaveReflex!)
                }
            }
            if conditionalChange.tempSaveWill != nil {
                HStack {
                    Text(conditionalChange.tempSaveWill!)
                }
            }
        }
    }
}

//@Persisted var modification: RealmSwift.List<Modification>
//@Persisted var temporaryModification: RealmSwift.List<TemporaryModification>
//@Persisted var tempSaveReflex: String?
//@Persisted var tempSaveWill: String?
//@Persisted var tempSaveFort: String?
//@Persisted var elseTemporaryModifications: RealmSwift.List<TemporaryModification>

