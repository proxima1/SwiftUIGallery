//
//  SwiftUIInlinePicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

//struct SwiftUIInlinePicker: View {
//    var body: some View {
//        Text("Hello, InlinePicker!")
//    }
//}

enum MyFruit {
	 case banana, apple, peach
}

//https://www.simpleswiftguide.com/how-to-create-and-use-picker-with-form-in-swiftui/

//InlinePickers are used with FORMs. Not Listviews as such. They
//give a set of choices looking just like a list item,

struct SwiftUIInlinePicker: View {
	

	 var body: some View {
Text("Hello world!")
	 }
}

struct SwiftUIInlinePicker_Previews: PreviewProvider {
    static var previews: some View {
		SwiftUIInlinePicker()
    }
}
