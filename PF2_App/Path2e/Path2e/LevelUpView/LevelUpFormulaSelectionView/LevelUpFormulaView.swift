


import Foundation
import SwiftUI
import RealmSwift


struct LevelUpFormulaView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var data: LoadDataModel
    @State private var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    var body: some View {
        List {
            ForEach(realmManager.character.formulaList!.formulas.filter("levelGained == %@", realmManager.character.level), id: \.self) { listFormula in
                NavigationLink(value: Route.levelUpFormulaCategoryListView(listFormula: listFormula)) {
                    SelectedFormulaListButtonView(listFormula: listFormula)
                }
            }
        }
        .navigationBarItems(trailing: Button {
            var isSuccess = true
//            for listFormula in realmManager.character.formulaList!.formulas.filter("levelGained == %@", realmManager.character.level) {
//                if listFormula.id == 0 {
//                    isSuccess = false
//                    alertType = .chooseAlchemicalFormula
//                    showAlert = true
//                }
//            }
            if isSuccess {
                appState.popToRoot()
            }
        } label: {
            Text("Next")
        }
            .alert(isPresented: $showAlert, content: {
                getAlert(myAlert: alertType)
            }))
    }
}



struct SelectedFormulaListButtonView: View {
    let listFormula: CharacterListFormula
    @EnvironmentObject var data: LoadDataModel
    var body: some View {
        HStack {
            if listFormula.id != 0 {
                let formula = data.items.filter("id == %@", listFormula.id)[0]
                if formula.name.contains("Ammunition") || formula.name.contains("Bullet") || formula.name.contains("Shot") || formula.name.contains("Powder") {
                    Image("Ammunition")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(401) {
                    Image("Bomb")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(842) {
                    Image("Drug")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(536) {
                    Image("Mutagen")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(200) {
                    Image("Healing")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(5002) {
                    Image("Monstrocity")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(535) {
                    Image("Elixer")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else if formula.traits.contains(331) {
                    Image("Poison")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                } else {
                    Image("Other")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
            }
            Text(listFormula.id == 0 ? "Select a Formula" : "Formula")
            Spacer()
            Text(listFormula.id == 0 ? "Unselected" : listFormula.name)
                .foregroundColor(.secondary)
        }
        .padding([.top, .bottom], 0)
        .frame(height: 25)
    }
}
