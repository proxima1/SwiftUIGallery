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
        VStack{
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
                    //as I get the error: Contextual closure type '() -> TupleView<...>' expects 0 arguments,
                    //but it was used in closure body
                    //The $0 is a value passed as an argument (apparently)
                    //and HStack takes no arguments.
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
        }.navigationBarTitle("Tumbler Picker", displayMode: .inline)
    }
}

struct SwiftUIWheelPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIWheelPicker()
    }
}
