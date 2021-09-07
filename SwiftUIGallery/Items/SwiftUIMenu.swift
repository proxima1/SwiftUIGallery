//
//  SwiftUIMenu.swift
//  SwiftUIGallery
//
//  Created by mike on 7/27/21.
//

import SwiftUI

struct RedBorderMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .border(Color.red)
    }
}

struct SwiftUIMenu: View {
    @State private var apolloPatch = "Apollo 11"
    let apolloPatches = ApolloPatches().apolloPatches
    
    var body: some View {
        Menu("Missions") {

            ForEach(apolloPatches.reversed(), id: \.self)
            {

                let patchName = $0
                
                Button(action:{
                        print("hit button: \(patchName)")
                    
                }){
                    Label(patchName, image: patchName).foregroundColor(.green)
                }
            }
        }.navigationBarTitle("menu", displayMode: .inline).foregroundColor(.green).font(.system(size: 30))

        Text("Context Menu")
            .padding()
            .contextMenu {
                Button("♥️ - Hearts", action: selectHearts)
                Button("♣️ - Clubs", action: selectClubs)
                Button("♠️ - Spades", action: selectSpades)
                Button("♦️ - Diamonds", action: selectDiamonds)
            }
    }
    
    func selectHearts() {
        print("Selecteed Hearts")
    }
    
    func selectClubs() {
        print("Selected Clubs")
    }
    
    func selectSpades() {
        print("Selected Spades")
    }
    
    func selectDiamonds() {
        print("Selected Diamonds")
    }
}

struct SwiftUIMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMenu()
    }
}
