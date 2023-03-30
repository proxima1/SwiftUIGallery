
// SwiftUIShapes: 

//
//  SwiftUIShapes.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

import SwiftUI

struct SwiftUIShapes: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Taken from Apple's Landmarks example")
                Badge()
            }
        }.navigationBarTitle("Shapes", displayMode: .inline)
    }
}

struct SwiftUIShapes_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShapes()
    }
}
