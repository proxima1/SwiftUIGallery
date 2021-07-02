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

struct Bookmark: Identifiable {
	 let id = UUID()
	 let name: String
	 let icon: String
	 var items: [Bookmark]?

	 // some example websites
	 static let apple = Bookmark(name: "Apple", icon: "1.circle")
	 static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
	 static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
	 static let twitter = Bookmark(name: "Twitter", icon: "mic")

	 // some example groups
	 static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
	 static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
	 static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

//struct menuItem<Value: Hashable>: Hashable
//{
//	 let value: String
//	 var children: [menuItem]? = nil
////	var linkedObject: View
//}

//struct buttonView(title: String, image: String)

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
		}
	}
}

extension menuItem: Identifiable {
	 // assuming `name` is unique, it can be used as our identifier
	 var id: String { title }
}
//struct mainMenu:



struct ContentView: View
{
	var _pickerItems: [menuItem] = [menuItem(title: "Wheel",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers())),
											  menuItem(title: "Inline",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers())),
											  menuItem(title: "Menu",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers())),
											  menuItem(title: "Popup",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers())),
											  menuItem(title: "Radio",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers())),
											  menuItem(title: "Segmented",  imageName: "paperclip", 	color: .gray,  navTarget: AnyView(SwiftUIPickers()))
	]
	var _menuItems: [menuItem] = [menuItem(title: "Buttons", imageName: "arrow.up", color: .red,  navTarget: AnyView(SwiftUIButtons())),
											menuItem(title: "Shapes", 	imageName: "clock", 		color: .green,  navTarget: AnyView(SwiftUIShapes())),
											menuItem(title: "Pickers", imageName: "arrow.down", color: .blue,  navTarget: AnyView(SwiftUIPickers())),
											menuItem(title: "Sliders", imageName: "cloud", 			color: .black,  navTarget: AnyView(SwiftUISliders())),
											menuItem(title: "Lists", 	imageName: "paperplane", color: .orange,  navTarget: AnyView(SwiftUILists())),
											menuItem(title: "Stacks", 	imageName: "doc.circle.fill", color: .gray,  navTarget: AnyView(SwiftUIStacks())),
											menuItem(title: "Toggles", imageName: "message", 	color: .gray,  navTarget: AnyView(SwiftUIToggles())),
											menuItem(title: "Images",  imageName: "calendar", 	color: .gray,  navTarget: AnyView(SwiftUIImages()))
	]
	
//	_menuItems[2].subMenu=_pickerItems[0]
	
//	_menuItems[2].subMenu[0]=_pickerItems[0]

	
	var body: some View
	{
		Image(systemName: "clock")
		NavigationView(){
			
			//how can I use ForEach in here? It wants menuItems to be Hashable
			//and equatable. The latter is a pain.
			
			//this example seems to not need Hash/Equatable
			//https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
			List{
				navMenuItemView(menuItem:_menuItems[0])
				navMenuItemView(menuItem:_menuItems[1])
//				navMenuItemView(menuItem:_menuItems[2])
				
				OutlineGroup(_menuItems[2],id: \.self, children: \.children) { item in
					 Text("\(item.description)")
				}
					
				navMenuItemView(menuItem:_menuItems[3])
				navMenuItemView(menuItem:_menuItems[4])
				navMenuItemView(menuItem:_menuItems[5])
				navMenuItemView(menuItem:_menuItems[6])
				navMenuItemView(menuItem:_menuItems[7])
			}
		}
	}
}

//public struct NavigationLink<Label, Destination> : View where Label : View, Destination : View {

struct navMenuItemView : View
{
//	 var link=NavigationLink(
//		destination: _menuItems[0].navTarget,
//		label: {_menuItems[0]}
//		)
	
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



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//		Group {
//			ContentView()
//		}
//    }
//}
