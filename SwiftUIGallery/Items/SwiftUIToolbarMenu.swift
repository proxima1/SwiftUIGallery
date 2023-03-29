//
//  SwiftUIToolbarMenu.swift
//  SwiftUIGallery
//
//  Created by mike on 3/24/23.
//

import SwiftUI

var _TBmenuItems: [menuItemToolbarExample] = [
    menuItemToolbarExample(title: "Basic Top Bar",imageName: "sun.max.circle", color: .red, placement: ToolbarItemPlacement.bottomBar),
    menuItemToolbarExample(title: "Bottom bar",   imageName: "waveform.path",  color: Color("Magenta"), placement: ToolbarItemPlacement.navigationBarTrailing),
    menuItemToolbarExample(title: "123 bar",      imageName: "paperplane",     color: Color("DarkBlue"), placement:ToolbarItemPlacement.navigationBarLeading)]

struct menuItemToolbarExample : View
{
    var title : String
    var imageName: String
    var color: Color
    var placement: ToolbarItemPlacement
    var children: [menuItemToolbarExample]?=nil
    
    var body: some View
    {
        HStack
        {
            Image(systemName: imageName).foregroundColor(color)
            Text(title).foregroundColor(color).font(.title)
        }.frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}
          
extension menuItemToolbarExample: Identifiable {
     // assuming `name` is unique, it can be used as our identifier
     var id: String { title }
}

struct SwiftUIToolbarMenu: View {
    var body: some View
    {
        NavigationStack(){
            List(_TBmenuItems, children: \.children) { item in
                
                if item.children == nil {
                    navToolBarMenuItemView(menuItem: item)
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

struct navToolBarMenuItemView : View
{
    var menuItem: menuItemToolbarExample
    
    var link: NavigationLink<AnyView,AnyView>
    
    init(menuItem: menuItemToolbarExample){
        self.menuItem = menuItem
        
        link=NavigationLink(
            destination: AnyView(SwiftUIToolbars(placement: menuItem.placement)),
                                 label: {AnyView(menuItem)}
        )
    }
    
    var body: some View
    {
        link
    }
}

struct SwiftUIToolbarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToolbarMenu()
    }
}
