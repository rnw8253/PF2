//
//  SkillSelectionDisplay.swift
//  Path2e
//
//  Created by Ryan Weber on 7/20/23.
//

import Foundation
import SwiftUI
import RealmSwift

struct SkillSelectionView: View {
    var selectableSkills: [String]? = nil
    var count: Int
    var maxProfInt: Int
    @ObservedObject var chosenSkill: ChosenSkill
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    @StateObject var skills = SkillsTracker()
    var totalCount: Int {
        var count = 0
        for skill in skills.skills {
            if skill.initiated {
                count += skill.currentProfInt - skill.initProfInt
            }
        }
        return count
    }
    var body: some View {
        VStack {
            Text("Choose \(count - totalCount) Skills")
            List {
                ForEach(skills.skills.indices, id: \.self) { index in
                    SingleSkillDisplay(skill: $skills.skills[index], count: count, totalCount: totalCount, maxProfInt: maxProfInt)
                }
            }
            .listStyle(.grouped)
            Button {
                if count - totalCount == 0 {
                    chosenSkill.clearData()
                    for skill in skills.skills {
                        if skill.initiated {
                            if skill.currentProfInt - skill.initProfInt != 0 {
                                chosenSkill.name.append(skill.skill)
                                chosenSkill.prof.append(convertIntToProf(value: skill.currentProfInt))
                            }
                        }
                    }
                    appState.popXViews(1)
                } else {
                    alertType = .chooseXSkills(count: count - totalCount)
                    showAlert = true
                }
            } label: {
                Text("Choose Skills")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemOrange),Color(.systemYellow)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Capsule())
            }
            .alert(isPresented: $showAlert, content: {
                getAlert(myAlert: alertType)
            })
        }
        .onAppear {
            skills.initiate(character: realmManager.character, selectableSkills: selectableSkills, excludeRoute: appState.path)
        }
    }
}




