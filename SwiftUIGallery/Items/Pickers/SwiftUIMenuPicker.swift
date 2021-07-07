//
//  SwiftUIMenuPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

struct SwiftUIMenuPicker: View {
	let apolloPatches = ApolloPatches().apolloPatches
	@State private var selectedFrameworkIndex = 0
	
	var body: some View {
		NavigationView {
			
			//the InlinePicker is the default when adding to a form.
			//PickerStyle can be used for other types. Interestingly enough
			//specifying the InlinePickerStyle() forces the use of
			//the Wheels. I think this a product of how a type of picker
			//can be overriden by a system default. Doesn't make sense here.
			
			Form {
				Section {
					Picker(selection: $selectedFrameworkIndex, label: Text("Apollo Patches")) {
						ForEach(0 ..< apolloPatches.count) {
//							Text(self.apolloPatches[$0])
							
							let patchName = apolloPatches[$0]
							let tempText = Text(patchName)
							let tempImage = Image(patchName).resizable().frame(width:20,height:20,alignment:.leading)

							HStack{
								tempImage
								tempText
							}
						}
					}.pickerStyle(MenuPickerStyle())
				}
			}
			.navigationBarTitle("Favorites").foregroundColor(.blue)
		}
	}
}

struct SwiftUIMenuPicker_Previews: PreviewProvider {
    static var previews: some View {
		SwiftUIMenuPicker()
    }
}
