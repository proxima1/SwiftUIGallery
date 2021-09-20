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

struct SwiftUIColorPicker: View {
    
    @State var labelText = "color picker"
    @State private var selectedColor =
        Color(.sRGB, red: 0.1, green: 0.5, blue: 1.0)
    
    var body: some View {
        
        VStack{
            Spacer()
            Circle()
                .fill(selectedColor)
                .frame(width: 200, height: 200, alignment: .top)
            
            Spacer()
            Spacer()
            Spacer()

            Text("Color Picker Demo").foregroundColor(selectedColor).font(.largeTitle)
            
            ColorPicker("Pick Your Color", selection: $selectedColor).frame(maxWidth: 200.0, maxHeight: 150.0)
            
            Spacer()
        }.navigationBarTitle("Color Picker", displayMode: .inline)
    }
}

struct SwiftUIColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColorPicker()
    }
}
