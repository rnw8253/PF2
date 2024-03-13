//
//  ItemBasicDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct ItemBasicDisplay: View {
    let item: ItemData
    var body: some View {
        Section(header: Text("Basic Info")) {
            HStack {
                Text("Source")
                Spacer()
                Text(item.contentSrc)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Rarity")
                Spacer()
                Text(item.rarity.capitalized)
                    .foregroundColor(.secondary)
            }
            if item.level > 0 {
                HStack {
                    Text("Level")
                    Spacer()
                    Text(String(item.level))
                        .foregroundColor(.secondary)
                }
            }
            if item.price != nil {
                if item.price! > 0 {
                    HStack {
                        Text("Price")
                        Spacer()
                        Text(calculateMoney(cp: item.price!))
                            .foregroundColor(.secondary)
                    }
                }
            }
            HStack {
                Text("Size")
                Spacer()
                Text(item.size.capitalized)
                    .foregroundColor(.secondary)
            }
            if item.bulk != nil {
                if item.bulk! > 0 {
                    HStack {
                        Text("Bulk")
                        Spacer()
                        Text(String(item.bulk!))
                            .foregroundColor(.secondary)
                    }
                }
            }
            if item.hasQuantity != 1 {
                HStack {
                    Text("Quantity")
                    Spacer()
                    Text(String(item.hasQuantity))
                        .foregroundColor(.secondary)
                }
            }
            Group {
                if item.hitPoints != nil {
                    if item.hitPoints! > 0 {
                        HStack {
                            Text("Hit Points")
                            Spacer()
                            Text(String(item.hitPoints!))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if item.brokenThreshold != nil {
                    if item.brokenThreshold! > 0 {
                        HStack {
                            Text("Broken Threshold")
                            Spacer()
                            Text(String(item.brokenThreshold!))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if item.hardness != nil {
                    if item.hardness! > 0 {
                        HStack {
                            Text("Hardness")
                            Spacer()
                            Text(String(item.hardness!))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                if item.hands != nil {
                    if item.hands != "None" && item.hands != "NONE" {
                        HStack {
                            Text("Hands")
                            Spacer()
                            Text(String(item.hands!))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

