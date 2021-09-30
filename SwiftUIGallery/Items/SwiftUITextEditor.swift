
//  SwiftUITextEditor

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

struct SwiftUITextEditor: View {
    @State private var someText: String  = "\n****  COMMODORE 64 BASIC X2  ****\n64K RAM SYSTEM 38911 BASIC BYTES FREE\nREADY. 🀫 "
    
    init()
    {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
            VStack{
                Spacer()
                TextEditor(text: $someText)
                    .multilineTextAlignment(.center)
                    .background(Color(.sRGB,red:0.0,green:0.0,blue:0.6,opacity:1.0).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                    .foregroundColor(Color(.sRGB,red:0.4,green:0.4,blue:1.0,opacity:1.0))
                    .font(.headline)
            }.navigationBarTitle("Text Editor", displayMode: .inline)
            .foregroundColor(.red)
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}
