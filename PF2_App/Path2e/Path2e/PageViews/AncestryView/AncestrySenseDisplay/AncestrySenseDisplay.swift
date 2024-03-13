//
//  AncestryStatSenseDisplay.swift
//  PF2
//
//  Created by Ryan Weber on 7/26/22.
//

import SwiftUI

struct AncestrySenseDisplay: View {
    let ancestry: AncestryData
    var body: some View {
        Section(header: Text("Senses")) {
            HStack {
                NavigationLink(value: Route.visionView(vision: ancestry.visionSense!)) {
                    HStack {
                        Text(ancestry.visionSense!.name)
                    }
                }
            }
            if ancestry.additionalSense != nil {
                HStack {
                    NavigationLink(value: Route.senseView(sense: ancestry.additionalSense!)) {
                        HStack {
                            Text(ancestry.additionalSense!.name)
                        }
                    }
                }
            }
        }
    }
}

