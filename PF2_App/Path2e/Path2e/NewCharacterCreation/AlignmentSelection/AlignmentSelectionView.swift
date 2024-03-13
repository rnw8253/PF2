//
//  AlignmentView.swift
//  PF2
//
//  Created by Ryan Weber on 1/17/22.
//

import SwiftUI
import RealmSwift

struct AlignmentSelectionView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @State var ethics = "Neutral"
    @State var morals = "Neutral"
    var ethicsImages = ["Lawful":"hammer.circle","Neutral":"staroflife.fill","Chaotic":"tornado"]
    var moralsColors = ["Good":Color.blue,"Neutral":Color.gray,"Evil":Color.red]
    var descriptions: [String:String] = ["Lawful Good":"Lawful Good characters are dedicated to upholding order and justice. They believe in doing what's right, following the law, and helping others, often at great personal sacrifice.","Neutral Good":"Neutral Good characters seek to do good and help others, but they are not bound by a strict code of ethics. They tend to be flexible and adaptable in their approach to moral dilemmas.","Chaotic Good":"Chaotic Good characters value individuality, freedom, and kindness. They believe in doing what's right but often reject conventional authority and rules in favor of personal freedom.","Lawful Neutral":"Lawful Neutral characters prioritize order and structure. They adhere to a strict code or set of laws, and their actions are often guided by duty and tradition, regardless of personal morality.","Neutral Neutral":"True Neutral characters are typically indifferent to questions of good and evil, focusing on balance and maintaining neutrality. They often act in self-interest or according to the situation at hand.","Chaotic Neutral":"Chaotic Neutral characters are unpredictable and prioritize personal freedom above all else. They may engage in both good and evil acts, depending on their whims and desires.","Lawful Evil":"Lawful Evil characters are ruthless and manipulative. They use the structure of the law and society to further their own selfish goals, often exploiting rules and regulations to their advantage.","Neutral Evil":"Neutral Evil characters are self-serving and lack a strong commitment to a specific code. They are primarily concerned with their own interests and will harm or manipulate others to achieve their goals.","Chaotic Evil":"Chaotic Evil characters are destructive and anarchic. They revel in chaos and mayhem, showing little regard for the well-being of others. They seek to sow discord and cause harm for personal gain or pleasure."]
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Spacer()
                VStack{
                    Image(systemName: ethicsImages[ethics]!)
                        .font(.system(size: 200))
                        .foregroundColor(moralsColors[morals])
                    Text(ethics+" "+morals)
                }
                .frame(width: 250, height: 250)
                Text(descriptions[String(ethics+" "+morals)]!)
                    .padding([.leading,.trailing],10)
                //                .overlay(RoundedRectangle(cornerRadius: 10)
                //                    .stroke(Color.black, lineWidth: 4))
                    .frame(height: 150)
                Spacer()
                Text("Choose Ethics")
                    .font(.title)
                Picker("Ethics", selection: $ethics) {
                    Text("Lawful").tag("Lawful")
                    Text("Neutral").tag("Neutral")
                    Text("Chaotic").tag("Chaotic")
                }
                .pickerStyle(SegmentedPickerStyle())
                Text("Choose Morals")
                    .font(.title)
                Picker("Morals", selection: $morals) {
                    Text("Good").tag("Good")
                    Text("Neutral").tag("Neutral")
                    Text("Evil").tag("Evil")
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
                Spacer()
            }
            Button {
                realmManager.updateCharacterAlignment(id: realmManager.character.id, ethics: ethics, morals: morals)
                appState.popXViews(1)
            } label: {
                Text("Select Alignment")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue),Color(.systemPurple)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Capsule())
                
            }
        }
        .navigationBarTitle("Select Alignment", displayMode: .inline)
    }
}

