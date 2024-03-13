




import SwiftUI
import RealmSwift

struct LanguageView: View {
    var language: Language
    var body: some View {
        VStack {
            List {
                if language.descriptions != nil {
                    Section(header: Text("Description")) {
                        Text(language.descriptions!)
                    }
                }
                
                Section(header: Text("Speakers")) {
                    Text(language.speakers)
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(language.name, displayMode: .inline)
        .padding(.bottom)
    }
}
