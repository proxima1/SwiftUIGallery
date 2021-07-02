//
//  SwiftUIWheelPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/17/21.
//

import SwiftUI

struct SwiftUIWheelPicker: View {
	
	@State private var apolloPatch = "Apollo 11"
	
//	let apolloPatches = ["Apollo 1","Apollo 7","Apollo 8","Apollo 9",
//							  "Apollo 10","Apollo 11",
//							  "Apollo 12","Apollo 13","Apollo 14",
//							  "Apollo 15","Apollo 16","Apollo 17"]

	var body: some View {
		VStack{
			customTumblerPicker()
		}
	}
}

struct customTumblerPicker: View {
	
	@State private var apolloPatch = "Apollo 11"
	@State private var showPickers = false
	
	let apolloPatches = ["Apollo 1","Apollo 7","Apollo 8","Apollo 9",
							  "Apollo 10","Apollo 11",
							  "Apollo 12","Apollo 13","Apollo 14",
							  "Apollo 15","Apollo 16","Apollo 17","Apollo 18"]
	
//	https://stackoverflow.com/questions/63228081/swiftui-2-0-list-with-children-how-to-make-the-tappable-area-of-the-disclosure
	
	var body: some View {

//			Text("The line beloc")
			HStack{ Text("My favorite Apollo patch is \(apolloPatch)")
				Image(apolloPatch).resizable().frame(width:20,height:20,alignment:.center)
			}
			Picker("What kind of cat can I get you today?",selection: $apolloPatch){
				ForEach(apolloPatches, id: \.self)
				{
					let tempText = Text($0)
					let tempImage = Image($0).resizable().frame(width:20,height:20,alignment:.leading)
					
					//Note that I can't use something like Text($0) in an HStack
					//as I get the error Contextual closure type '() -> TupleView<...>' expects 0 arguments, but 1 was used in closure body error show
					//The $0 is a value passed as an argument (apparently) and HStack takes no arguments.
					//By assigning the values above we now have accessable properties that
					//can be used instead.
					
					HStack{
						tempText
						tempImage
					}
				
				}.pickerStyle(WheelPickerStyle())
			}.accentColor(.red).padding()
			
			Text(apolloPatch).foregroundColor(Color.red).font(.headline)
			Image(apolloPatch).resizable().frame(width:100,height:100,alignment:.center)
	}
}

//struct datePicker: View {
////	var labelText: String
//
//	@State private var date = Date()
//
//	var body: some View {
//		DatePicker(
//			 "Start Date",
//			 selection: $date,
//			displayedComponents: [.date, .hourAndMinute]
//		)
//	}
//}

struct SwiftUIWheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIWheelPicker()
    }
}
