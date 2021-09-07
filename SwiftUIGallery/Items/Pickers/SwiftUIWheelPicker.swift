//
//  SwiftUIWheelPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/17/21.
//

import SwiftUI

struct SwiftUIWheelPicker: View {
	
	@State private var apolloPatch = "Apollo 11"
	
	var body: some View {
		VStack{
			customTumblerPicker()
		}
	}
}

struct customTumblerPicker: View {
	
	@State private var apolloPatch = "Apollo 11"
	@State private var showPickers = false
	let apolloPatches = ApolloPatches().apolloPatches
	
//	https://stackoverflow.com/questions/63228081/swiftui-2-0-list-with-children-how-to-make-the-tappable-area-of-the-disclosure
	
	var body: some View {
			HStack{
                Text("My favorite Apollo patch is \(apolloPatch)")
				Image(apolloPatch).resizable().frame(width:20,height:20,alignment:.center)
			}
			Picker("This Shouldnt show",selection: $apolloPatch){
                ForEach(apolloPatches.reversed(), id: \.self)
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
				
				}
			}.accentColor(.red).padding().pickerStyle(WheelPickerStyle())
			
			Text(apolloPatch).foregroundColor(Color.red).font(.headline)
			Image(apolloPatch).resizable().frame(width:100,height:100,alignment:.center)
//        }.navigationBarTitle("tumbler picker", displayMode: .inline)
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
