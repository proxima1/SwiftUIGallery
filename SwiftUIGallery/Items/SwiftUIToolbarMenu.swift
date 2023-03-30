//
//  SwiftUIToolbarMenu.swift
//  SwiftUIGallery
//
//  Created by mike on 3/24/23.
//

import SwiftUI

//var _TBmenuItems: [menuItemToolbarExample] = [
//    menuItemToolbarExample(title: "Basic Top Bar",imageName: "sun.max.circle", color: .red, placement: ToolbarItemPlacement.bottomBar),
//    menuItemToolbarExample(title: "Bottom bar",   imageName: "waveform.path",  color: Color("Magenta"), placement: ToolbarItemPlacement.navigationBarTrailing),
//    menuItemToolbarExample(title: "123 bar",      imageName: "paperplane",     color: Color("DarkBlue"), placement:ToolbarItemPlacement.navigationBarLeading)]


struct menuItemToolbarExample : View
{
    var title : String
    var imageName: String
    var color: Color
//    var placement: ToolbarItemPlacement
    var children: [menuItemToolbarExample]?=nil
    var navTarget: AnyView
    var body: some View
    {
        HStack
        {
            Image(systemName: imageName).foregroundColor(color)
            Text(title).foregroundColor(color).font(.system(size: 18.0))
        }.frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}
          
var _TBmenuItems: [menuItemToolbarExample] = [
    menuItemToolbarExample(title: "Simple text toolbar",imageName: "paperplane", color: Color("DustyBlue"), navTarget: AnyView(SwiftUIToolbars(idString: "simpleTextBar",placement: ToolbarItemPlacement.bottomBar))),
    
    menuItemToolbarExample(title: "Text and image toolbar",  imageName: "paperplane",  color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "simpleTextImageBar",placement: ToolbarItemPlacement.navigationBarLeading))),
    
    menuItemToolbarExample(title: "Multiple toolbar sources",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "multiple",placement: ToolbarItemPlacement.navigationBarTrailing))),
    
    menuItemToolbarExample(title: "Dropdown Menu",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "titlemenu",placement: ToolbarItemPlacement.navigationBarTrailing))),
    
    menuItemToolbarExample(title: "Picker",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "datepicker",placement: ToolbarItemPlacement.bottomBar))),
    
    menuItemToolbarExample(title: "Compound object: top right",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "compoundobject",placement: ToolbarItemPlacement.navigationBarTrailing))),
    
    menuItemToolbarExample(title: "Compound object: top left",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "compoundobject",placement: ToolbarItemPlacement.navigationBarLeading))),
    
    menuItemToolbarExample(title: "Compound object: bottom",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "compoundobject",placement: ToolbarItemPlacement.bottomBar))),
    
    menuItemToolbarExample(title: "Bottom toolbar",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "bottombar2",placement: ToolbarItemPlacement.bottomBar))),
    
//    menuItemToolbarExample(title: "Toolbar with link",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "toolbarwithlink",placement: ToolbarItemPlacement.navigationBarTrailing))),
    
    menuItemToolbarExample(title: "Customizable Toolbar (iPad)",      imageName: "paperplane",     color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "customizable",placement: ToolbarItemPlacement.navigationBarTrailing))),
    
    menuItemToolbarExample(title: "Toolbar with link",      imageName: "paperplane",color: Color("DustyBlue"),navTarget: AnyView(SwiftUIToolbars(idString: "toolbarwithlink",placement: ToolbarItemPlacement.navigationBarTrailing))),]

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
            destination: menuItem.navTarget,
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
