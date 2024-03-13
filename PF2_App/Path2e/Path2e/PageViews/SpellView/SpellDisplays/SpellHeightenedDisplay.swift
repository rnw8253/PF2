//
//  SpellHeightenedDisplays.swift
//  PF2
//
//  Created by Ryan Weber on 7/24/22.
//

import SwiftUI

struct SpellHeightenedDisplays: View {
    let spell: SpellData
    var body: some View {
        if spell.heightenedOneVal != nil || spell.heightenedOneText != nil || spell.heightenedTwoVal != nil || spell.heightenedTwoText != nil || spell.heightenedThreeVal != nil || spell.heightenedThreeText != nil || spell.heightenedFourVal != nil || spell.heightenedFourText != nil {
            Section(header: Text("Heightened")){
                if spell.heightenedOneVal != nil {
                    switch spell.heightenedOneVal {
                    case "PLUS_ONE":
                        Text("(+1): \(spell.heightenedOneText!)")
                    case "PLUS_TWO":
                        Text("(+2): \(spell.heightenedOneText!)")
                    case "PLUS_THREE":
                        Text("(+3): \(spell.heightenedOneText!)")
                    case "LEVEL_10":
                        Text("(10th): \(spell.heightenedOneText!)")
                    case "LEVEL_9":
                        Text("(9th): \(spell.heightenedOneText!)")
                    case "LEVEL_8":
                        Text("(8th): \(spell.heightenedOneText!)")
                    case "LEVEL_7":
                        Text("(7th): \(spell.heightenedOneText!)")
                    case "LEVEL_6":
                        Text("(6th): \(spell.heightenedOneText!)")
                    case "LEVEL_5":
                        Text("(5th): \(spell.heightenedOneText!)")
                    case "LEVEL_4":
                        Text("(4th): \(spell.heightenedOneText!)")
                    case "LEVEL_3":
                        Text("(3rd): \(spell.heightenedOneText!)")
                    case "LEVEL_2":
                        Text("(2nd): \(spell.heightenedOneText!)")
                    default:
                        Text("Custom: \(spell.heightenedOneText!)")
                    }
                }
                if spell.heightenedTwoVal != nil {
                    switch spell.heightenedTwoVal {
                    case "PLUS_ONE":
                        Text("(+1): \(spell.heightenedTwoText!)")
                    case "PLUS_TWO":
                        Text("(+2): \(spell.heightenedTwoText!)")
                    case "PLUS_THREE":
                        Text("(+3): \(spell.heightenedTwoText!)")
                    case "LEVEL_10":
                        Text("(10th): \(spell.heightenedTwoText!)")
                    case "LEVEL_9":
                        Text("(9th): \(spell.heightenedTwoText!)")
                    case "LEVEL_8":
                        Text("(8th): \(spell.heightenedTwoText!)")
                    case "LEVEL_7":
                        Text("(7th): \(spell.heightenedTwoText!)")
                    case "LEVEL_6":
                        Text("(6th): \(spell.heightenedTwoText!)")
                    case "LEVEL_5":
                        Text("(5th): \(spell.heightenedTwoText!)")
                    case "LEVEL_4":
                        Text("(4th): \(spell.heightenedTwoText!)")
                    case "LEVEL_3":
                        Text("(3rd): \(spell.heightenedTwoText!)")
                    case "LEVEL_2":
                        Text("(2nd): \(spell.heightenedTwoText!)")
                    default:
                        Text("Custom: \(spell.heightenedTwoText!)")
                    }
                }
                if spell.heightenedThreeVal != nil {
                    switch spell.heightenedThreeVal {
                    case "PLUS_ONE":
                        Text("(+1): \(spell.heightenedThreeText!)")
                    case "PLUS_TWO":
                        Text("(+2): \(spell.heightenedThreeText!)")
                    case "PLUS_THREE":
                        Text("(+3): \(spell.heightenedThreeText!)")
                    case "LEVEL_10":
                        Text("(10th): \(spell.heightenedThreeText!)")
                    case "LEVEL_9":
                        Text("(9th): \(spell.heightenedThreeText!)")
                    case "LEVEL_8":
                        Text("(8th): \(spell.heightenedThreeText!)")
                    case "LEVEL_7":
                        Text("(7th): \(spell.heightenedThreeText!)")
                    case "LEVEL_6":
                        Text("(6th): \(spell.heightenedThreeText!)")
                    case "LEVEL_5":
                        Text("(5th): \(spell.heightenedThreeText!)")
                    case "LEVEL_4":
                        Text("(4th): \(spell.heightenedThreeText!)")
                    case "LEVEL_3":
                        Text("(3rd): \(spell.heightenedThreeText!)")
                    case "LEVEL_2":
                        Text("(2nd): \(spell.heightenedThreeText!)")
                    default:
                        Text("Custom: \(spell.heightenedThreeText!)")
                    }
                }
                if spell.heightenedFourVal != nil {
                    switch spell.heightenedFourVal {
                    case "PLUS_ONE":
                        Text("(+1): \(spell.heightenedFourText!)")
                    case "PLUS_TWO":
                        Text("(+2): \(spell.heightenedFourText!)")
                    case "PLUS_THREE":
                        Text("(+3): \(spell.heightenedFourText!)")
                    case "LEVEL_10":
                        Text("(10th): \(spell.heightenedFourText!)")
                    case "LEVEL_9":
                        Text("(9th): \(spell.heightenedFourText!)")
                    case "LEVEL_8":
                        Text("(8th): \(spell.heightenedFourText!)")
                    case "LEVEL_7":
                        Text("(7th): \(spell.heightenedFourText!)")
                    case "LEVEL_6":
                        Text("(6th): \(spell.heightenedFourText!)")
                    case "LEVEL_5":
                        Text("(5th): \(spell.heightenedFourText!)")
                    case "LEVEL_4":
                        Text("(4th): \(spell.heightenedFourText!)")
                    case "LEVEL_3":
                        Text("(3rd): \(spell.heightenedFourText!)")
                    case "LEVEL_2":
                        Text("(2nd): \(spell.heightenedFourText!)")
                    default:
                        Text("Custom: \(spell.heightenedFourText!)")
                    }
                }
            }
        }
    }
}

