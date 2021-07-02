//
//  ContentView.swift
//  SwiftUIGallery
//
//  Created by mike on 10/22/20.
//

import SwiftUI

//struct Tree<Value: Hashable>: Hashable {
//	 let value: Value
//	 var children: [Tree]? = nil
//}





////////////////////////////////////////////////////

struct menuItem : View
{
	var title : String
	var imageName: String
	var color: Color
	var navTarget: AnyView
	var children: [menuItem]?=nil
	
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

extension menuItem: Identifiable {
	 // assuming `name` is unique, it can be used as our identifier
	 var id: String { title }
}

var _pickerItems: [menuItem] = [menuItem(title: "Wheel",  imageName: "paperclip", 	color: .red,  navTarget: AnyView(SwiftUIWheelPicker())),
										  menuItem(title: "Inline",  imageName: "paperclip", 	color: .green,  navTarget: AnyView(SwiftUIInlinePicker())),
										  menuItem(title: "Menu",  imageName: "paperclip", 	color: .blue,  navTarget: AnyView(SwiftUIMenuPicker())),
										  menuItem(title: "Popup",  imageName: "paperclip", 	color: .purple,  navTarget: AnyView(SwiftUIPopupPicker())),
										  menuItem(title: "Radio",  imageName: "paperclip", 	color: .orange,  navTarget: AnyView(SwiftUIRadioPicker())),
										  menuItem(title: "Segmented",  imageName: "paperclip", 	color: .pink,  navTarget: AnyView(SwiftUISegmentedPicker())),
										  menuItem(title: "Date",  imageName: "paperclip", 	color: .pink,  navTarget: AnyView(SwiftUIDatePicker()))
]


var _menuItems: [menuItem] = [menuItem(title: "Buttons", imageName: "arrow.up", color: .red,  navTarget: AnyView(SwiftUIButtons())),
										menuItem(title: "Shapes", 	imageName: "clock", 		color: .green,  navTarget: AnyView(SwiftUIShapes())),
										menuItem(title: "Pickers", imageName: "arrow.down", color: .blue,  navTarget: AnyView(SwiftUIWheelPicker()), children:_pickerItems),
										menuItem(title: "Sliders", imageName: "cloud", 			color: .black,  navTarget: AnyView(SwiftUISliders())),
										menuItem(title: "Lists", 	imageName: "paperplane", color: .orange,  navTarget: AnyView(SwiftUILists())),
										menuItem(title: "Stacks", 	imageName: "doc.circle.fill", color: .gray,  navTarget: AnyView(SwiftUIStacks())),
										menuItem(title: "Toggles", imageName: "message", 	color: .gray,  navTarget: AnyView(SwiftUIToggles())),
										menuItem(title: "Images",  imageName: "calendar", 	color: .gray,  navTarget: AnyView(SwiftUIImages())),
										menuItem(title: "Color Support",  imageName: "paintbrush", 	color: .gray,  navTarget: AnyView(SwiftUIColor()))

]


struct ContentView: View
{
	var body: some View
	{
		NavigationView(){
			
			List(_menuItems, children: \.children) { item in
				
				if item.children == nil {
					navMenuItemView(menuItem:item)
				}
				else{
					item.onTapGesture {
						print("Show details for user")
					}
				}
			}
		}
	}
}


//public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {

struct navMenuItemView : View
{
	var menuItem: menuItem
	
	var link: NavigationLink<AnyView,AnyView>
	
	init(menuItem: menuItem){
		self.menuItem=menuItem
		
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView()
		}
    }
}
