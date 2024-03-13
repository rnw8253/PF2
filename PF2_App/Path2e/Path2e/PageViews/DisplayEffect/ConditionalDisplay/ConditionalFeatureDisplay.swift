//
//  ConditionalFeatureDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 10/17/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct ConditionalFeatureDisplay: View {
    var conditionalChanges: RealmSwift.List<ConditionalChanges>
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        ForEach(conditionalChanges, id: \.self) { conditionalChange in
            if conditionalChange.givePhysicalFeatureName != nil {
                Section(header: Text(returnConditionalHeader(conditionalChange: conditionalChange))) {
                    NavigationLink(value: Route.itemView(item: data.items.filter("name == %@",conditionalChange.givePhysicalFeatureName!)[0])) {
                        HStack {
                            Text("Physical Feature")
                            Spacer()
                            Text(conditionalChange.givePhysicalFeatureName!)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
//            @Persisted var giveSpeed: GiveSpeed? = nil
//            @Persisted var giveResistance: RealmSwift.List<Resistance>
//            @Persisted var givePhysicalFeatureName: String? = nil
//            @Persisted var elseGiveSpeed: GiveSpeed? = nil
        }
    }
}

//@Persisted var giveSpeed: GiveSpeed? = nil
//@Persisted var giveResistance: RealmSwift.List<Resistance>
//@Persisted var givePhysicalFeatureName: String? = nil
//@Persisted var elseGiveSpeed: GiveSpeed? = nil
//@Persisted var upgradeVision: Bool = false
//@Persisted var elseGiveLowLightVision: Bool = false
//@Persisted var chooseLanguage: Int = 0

