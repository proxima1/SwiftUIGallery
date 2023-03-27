//
//  SwiftUIToolbarMenu.swift
//  SwiftUIGallery
//
//  Created by mike on 3/24/23.
//

import SwiftUI



var _TBmenuItems: [menuItem] = [menuItem(title: "Basic Top Bar",
                               imageName: "sun.max.circle", color: .red,  navTarget: AnyView(SwiftUIToolbars())),
                              menuItem(title: "Bottom bar",   imageName: "waveform.path",     color:  Color("Magenta"),navTarget: AnyView(SwiftUIToolbars())),
                                menuItem(title: "123 bar",     imageName: "paperplane", color: Color("DarkBlue"),  navTarget: AnyView(SwiftUIToolbars())),
                                ]
                                
struct SwiftUIToolbarMenu: View {

    var body: some View
    {
        NavigationStack(){
            List(_TBmenuItems, children: \.children) { item in
                
                if item.children == nil {
                    navMenuItemView(menuItem:item)
                }
                else{
                    item.onTapGesture {
                        print("Show details for user")
                    }
                }
            }.navigationTitle("Toolbars")
        }
    }
}

struct SwiftUIToolbarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToolbarMenu()
    }
}
