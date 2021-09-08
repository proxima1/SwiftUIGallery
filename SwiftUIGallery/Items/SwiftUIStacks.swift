//
//  SwiftUIStacks.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

import SwiftUI

struct SwiftUIStacks: View {
    var body: some View {
        NavigationView{
        Text("Stacks Land")
        }.navigationBarTitle("Stacks", displayMode: .inline)
    }
}

struct SwiftUIStacks_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStacks()
    }
}
