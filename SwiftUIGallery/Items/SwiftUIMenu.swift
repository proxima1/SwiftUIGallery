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
//            Button(){
//
//            }label: {
//                Label("Choose mission", image: "Apollo 11")
//            }

            ForEach(apolloPatches.reversed(), id: \.self)
            {

                let patchName = $0
                
                Button(action:{
                        print("hit button: \(patchName)")
                    
                }){
                    Label(patchName, image: patchName)
                }
            }
        }.navigationBarTitle("menu", displayMode: .inline)

    }
    
}

struct SwiftUIMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMenu()
    }
}
