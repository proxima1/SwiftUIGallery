//
// From SwiftUI by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(id: "options") {
                    // this is a primary action, so will always be visible
                    ToolbarItem(id: "settings", placement: .primaryAction) {
                        Button("Settings") { }
                    }
    
                    // this is a standard secondary action, so will be customizable
                    ToolbarItem(id: "help", placement: .secondaryAction) {
                        Button("Help") { }
                    }
    
                    // another customizable button
                    ToolbarItem(id: "email", placement: .secondaryAction) {
                        Button("Email Me") { }
                    }
    
                    // a third customizable button, but this one won't be in the toolbar by default
                    ToolbarItem(id: "credits", placement: .secondaryAction, showsByDefault: false) {
                        Button("Credits") { }
                    }
                }
                .toolbarRole(.editor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
