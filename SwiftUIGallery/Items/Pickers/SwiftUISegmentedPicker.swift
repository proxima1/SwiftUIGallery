//
//  SwiftUISegmentedPicker..swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

struct SwiftUISegmentedPicker: View {
	@State private var apolloPatch = "Apollo 9"
	@State private var selectedFrameworkIndex = 0
	
	let apolloPatches = ApolloPatches().apolloPatches[..<4]
	
	var body: some View {
		
		//the InlinePicker is the default when adding to a form.
		//PickerStyle can be used for other types. Interestingly enough
		//specifying the InlinePickerStyle() forces the use of
		//the Wheels. I think this a product of how a type of picker
		//can be overriden by a system default. Doesn't make sense here.
		
		Form {
			Section {
				Picker(selection: $apolloPatch, label: Text("Apollo Patches")) {
					Group{
						
						ForEach(apolloPatches, id: \.self) {
							
//							let patchName = $0
							let tempText = Text($0)
//							let tempImage = Image(patchName).resizable().frame(width:20,height:20,alignment:.leading)
							
							HStack{
								tempText
							}
						}
					}
				}.pickerStyle(SegmentedPickerStyle())//section
				
                //note that this takes the place of the traditional
                //callback closure.
                
				HStack{
					Spacer()
					VStack{
						Text(apolloPatch).foregroundColor(Color.red).font(.headline)
						Image(apolloPatch).resizable().frame(width:100,height:100,alignment:.center)
					}
					Spacer()
				}
			}	//Section
		}.navigationBarTitle("segmented picker", displayMode: .inline)
//Form
	}//View
}

struct SwiftUISegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
		SwiftUISegmentedPicker()
    }
}
