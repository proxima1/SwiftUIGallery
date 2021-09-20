//
//  SwiftUIMenu.swift
//  SwiftUIGallery
//
//  Created by mike on 7/27/21.
//
/*
 MIT License
 
 Copyright (c) 2021 Mike Smithwick
 
 Permission is hereby granted, free of charge,
 to any person obtaining a copy of this software
 and associated documentation files (the "Software"),
 to deal in the Software without restriction,
 including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice
 shall be included in all copies or substantial portions
 of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
 USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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
        }.navigationBarTitle("Menus", displayMode: .inline).foregroundColor(.green).font(.system(size: 30))
        
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
