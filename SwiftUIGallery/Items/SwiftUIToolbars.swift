//
//  SwiftUIToolbars.swift
//  SwiftUIGallery
//
//  Created by mike on 8/19/21.
//

import SwiftUI

struct ItemsToolbar: ToolbarContent {
    let add: () -> Void
    let sort: () -> Void
    let filter: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Spiny Lumpsucker 👍🏻", action: add)
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            Button("Wobbegong", action: sort)
            Button(action: filter)
            {
                Text("Streaked Tenrec")  //notice all of these attributes are ignored
                            //even though we're using a button
                .foregroundColor(.black).italic().padding()
                .background(Color.white)
                .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
            }
        }
    }
}

struct SwiftUIToolbars: View {
    @State var color = Color.red
    
    var body: some View {
        Text("Weird animal names").foregroundColor(color)
            .toolbar {
                ItemsToolbar {
                    print("Spiny Lumpsucker")
                    color = Color.red
                } sort: {
                    print("Tasselled Wobbegong")
                    color = Color.blue
                } filter: {
                    print("Streaked Tenrec")
                    color = Color("DarkGreen")
                }
            }
    }
}

struct SwiftUIToolbars_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToolbars()
    }
}
