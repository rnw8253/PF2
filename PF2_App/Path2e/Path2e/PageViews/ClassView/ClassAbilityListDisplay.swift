import SwiftUI

struct ClassAbilityListDisplay: View {
    var currentClass: ClassData
    @ObservedObject var appState = AppState()
    var body: some View {
        VStack {
            List {
                let levels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
                ForEach(levels, id: \.self) { level in
                    Section(header: Text("Level \(level)")) {
                        ForEach(currentClass.classAbility.filter("level == %@", level).sorted(byKeyPath: "name"), id: \.self) { classAbility in
                            NavigationLink(value: Route.classAbilityView(classAbility: classAbility)) {
                                HStack {
                                    Text(classAbility.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationBarTitle("\(currentClass.name) Class Abilities", displayMode: .inline)
            .padding(.top, 5)
        }
    }
}
