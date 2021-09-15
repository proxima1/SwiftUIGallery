//
//  ContentView.swift
//  SwiftUIGallery
//
//  Created by mike on 10/22/20.
//

import SwiftUI

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
										  menuItem(title: "Segmented",  imageName: "paperclip", 	color: .accentColor,  navTarget: AnyView(SwiftUISegmentedPicker())),
                                          menuItem(title: "Radio",  imageName: "paperclip",     color: .accentColor,  navTarget: AnyView(SwiftUIRadioButtons())),
                                          menuItem(title: "Color",  imageName: "paintpalette.fill",     color: .red,  navTarget: AnyView(SwiftUIColorPicker())),
										  menuItem(title: "Date",  imageName: "paperclip", 	color: .purple,  navTarget: AnyView(SwiftUIDatePicker()))
]

var _menuItems: [menuItem] = [menuItem(title: "Buttons", imageName: "arrow.up", color: .red,  navTarget: AnyView(SwiftUIButtons())),
                              menuItem(title: "GeometryReader",   imageName: "waveform.path",     color:  Color("DarkGreen"),navTarget: AnyView(SwiftUIGeometryReader())),
                              menuItem(title: "Gestures",   imageName: "waveform.path",     color:  .orange,navTarget: AnyView(SwiftUIGestureManager())),
                              menuItem(title: "GroupBox",   imageName: "waveform.path",     color:  Color("DustyBlue"),navTarget: AnyView(SwiftUIGroupBox())),
                              menuItem(title: "Groups Disclosure and Otherwise",   imageName: "waveform.path",     color:  Color("DarkGreen"),navTarget: AnyView(SwiftUIGroups())),
                              menuItem(title: "Editable Lists",     imageName: "paperplane", color: Color("Magenta"),  navTarget: AnyView(SwiftUIDynamicViewContentView())),
                              menuItem(title: "Forms",   imageName: "waveform.path",     color:  Color("PaleGreen"),  navTarget: AnyView(SwiftUIForms())),
                              menuItem(title: "Images",  imageName: "calendar",     color: .gray,  navTarget: AnyView(SwiftUIImages())),
                              menuItem(title: "Labels",     imageName: "moon.circle", color: Color("AccentColor"),  navTarget: AnyView(SwiftUILabels())),
                              menuItem(title: "Links",   imageName: "link",     color: Color("PaleGreen"),  navTarget: AnyView(SwiftUILinks())),
                              menuItem(title: "Lists",     imageName: "paperplane", color: .primary,  navTarget: AnyView(SwiftUILists())),
                              menuItem(title: "LazyGrids",     imageName: "clock", color: Color("DarkBlue"),  navTarget: AnyView(SwiftUILazyGrids())),
                              menuItem(title: "Menus",     imageName: "paperplane", color: Color("DarkGreen"),  navTarget: AnyView(SwiftUIMenu())),
                              menuItem(title: "Pickers", imageName: "arrow.down", color: .blue,  navTarget: AnyView(SwiftUIWheelPicker()), children:_pickerItems),
                              menuItem(title: "ProgressView", imageName: "infinity", color: .orange,  navTarget: AnyView(SwiftUIProgressView())),
                              menuItem(title: "ScrollView",     imageName: "doc.circle.fill", color: Color("DustyBlue"),  navTarget: AnyView(SwiftUIScrollView())),
                              menuItem(title: "Shapes", 	imageName: "clock", 		color: .green,  navTarget: AnyView(SwiftUIShapes())),
                              menuItem(title: "Sheets and Alerts",     imageName: "paperplane", color: Color("AccentColor"),  navTarget: AnyView(SwiftUISheetsAndAlerts())),
                              menuItem(title: "Sliders", imageName: "cloud", 			color: Color("DarkRed"),  navTarget: AnyView(SwiftUISliders())),
                              menuItem(title: "Stacks",     imageName: "doc.circle.fill", color: Color("AccentColor"),  navTarget: AnyView(SwiftUIStacks())),
                              menuItem(title: "Steppers",     imageName: "person.fill.and.arrow.left.and.arrow.right", color: .orange,  navTarget: AnyView(SwiftUISteppers())),
                              menuItem(title: "Tabs", imageName: "calendar.circle",     color: Color("DarkRed"),  navTarget: AnyView(SwiftUITabs())),
                              menuItem(title: "Text",     imageName: "paperplane", color: .purple,  navTarget: AnyView(SwiftUIText())),
                              menuItem(title: "Text Editor",     imageName: "paperplane", color: Color("DarkBlue"),  navTarget: AnyView(SwiftUITextEditor())),
                              menuItem(title: "Toggles", imageName: "message", 	color: .gray,  navTarget: AnyView(SwiftUIToggles())),
                              menuItem(title: "Toolbars", imageName: "message",     color: Color("DarkPurple"),  navTarget: AnyView(SwiftUIToolbars())),
                              menuItem(title: "ViewBuilder", imageName: "message",     color: Color("DustyBlue"),  navTarget: AnyView(SwiftUIViewBuilder())),
                              menuItem(title: "UIKitBridge", imageName: "calendar.circle",     color: Color("AccentColor"),  navTarget: AnyView(SwiftUIBridgeUIKit())),


]

struct ContentView: View
{
    var uiHostingView = SwiftUIHostingViewController()
    
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
            }.navigationTitle("SwiftUI HouseParty!")
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
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
                .previewDisplayName("iPhone X")
		}
    }
}
