//
//  SwiftUIMenuPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

struct SwiftUIMenuPicker: View {
	let apolloPatches = ApolloPatches().apolloPatches
    @State var apolloPatch: String = "Apollo 13"

	var body: some View {
		NavigationView {
			
			//the InlinePicker is the default when adding to a form.
			//PickerStyle can be used for other types. Interestingly enough
			//specifying the InlinePickerStyle() forces the use of
			//the Wheels. I think this a product of how a type of picker
			//can be overriden by a system default. Doesn't make sense here.
			
			Form {
				Section {
                    Picker("Select Patch: ",selection: $apolloPatch){
                        ForEach(apolloPatches, id: \.self){

                            let tempText = Text($0)
                            let tempImage = Image($0).resizable().frame(width:20,height:20,alignment:.leading)

                            HStack{
                                tempImage
                                tempText
                            }
                        }
                    }.pickerStyle(MenuPickerStyle())
				}
			}
        }.navigationBarTitle("menu picker", displayMode: .inline)
	}
}

struct SwiftUIMenuPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMenuPicker(apolloPatch: "Apollo 13")
    }
}
