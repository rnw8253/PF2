//
//  SkillSelectionDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/20/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SingleSkillDisplay: View {
    @Binding var skill: SkillProfTracker
    var count: Int
    var totalCount: Int
    var maxProfInt: Int
    @EnvironmentObject var preferences: Preferences
    var body: some View {
        HStack {
            //                    Image(skills.skillModType)
            //                        .resizable()
            //                        .aspectRatio(contentMode: .fit)
            //                        .frame( width: 35, height: 35)
            if skill.currentProfInt == skill.initProfInt {
                Text(skill.skill)
                    .frame(width: 100, alignment: .leading)
            } else {
                Text(skill.skill)
                    .foregroundColor(preferences.selectedColor)
                    .frame(width: 100, alignment: .leading)
            }
            Spacer()
            HStack {
                VStack{
                    Text(signInt(skill.totalModValue))
                    Text("Total")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                VStack{
                    Text(signInt(skill.skillModValue))
                    Text(skill.skillProfModtype.capitalized.prefix(3))
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                VStack{
                    Text(signInt(skill.currentSkillProfValue))
                    Text("Prof")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .frame(width: 85, alignment: .leading)
            HStack {
                ProficiencyBoxView(prof: skill.currentSkillProf, initProf: skill.initProf)
                if skill.canAlter && maxProfInt != skill.initProfInt {
                    Stepper("",value: $skill.currentProfInt, in: skill.initProfInt...min(skill.currentProfInt+count-totalCount,maxProfInt))
                        .controlSize(.mini)
                }
            }
            .frame(width: 180, alignment: .leading)
        }
    }
}

