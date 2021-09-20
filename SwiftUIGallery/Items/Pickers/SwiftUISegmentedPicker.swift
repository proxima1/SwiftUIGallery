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

struct SwiftUISegmentedPicker: View {
	@State private var apolloPatch = "Apollo 9"
	@State private var selectedFrameworkIndex = 0
	
	let apolloPatches = ApolloPatches().apolloPatches[..<4]
	
	var body: some View {
		Form {
			Section {
				Picker(selection: $apolloPatch, label: Text("Apollo Patches")) {
					Group{
						
						ForEach(apolloPatches, id: \.self) {
							
							let tempText = Text($0)
							
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
		}.navigationBarTitle("Segmented Picker", displayMode: .inline)
//Form
	}//View
}

struct SwiftUISegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
		SwiftUISegmentedPicker()
    }
}
