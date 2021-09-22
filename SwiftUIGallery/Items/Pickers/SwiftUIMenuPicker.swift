// SwiftUIMenuPicker: similar to a popup menu

/*
 MIT License
 
 Copyright (c) 2021 Mike Smithwick
 
 Permission is hereby granted, free of charge,
 to any person obtaining a copy of this software
 and associated documentation files (the "Software"),
 to deal in the Software without restriction,
 including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice
 shall be included in all copies or substantial portions
 of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
 USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import SwiftUI

struct SwiftUIMenuPicker: View {
	let apolloPatches = ApolloPatches().apolloPatches
    @State var apolloPatch: String = "Apollo 13"

	var body: some View {
		NavigationView {
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
        }.navigationBarTitle("Menu Picker", displayMode: .inline)
	}
}

struct SwiftUIMenuPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMenuPicker(apolloPatch: "Apollo 13")
    }
}
