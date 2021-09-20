//
//  SwiftUISliders.swift

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

//SwiftUI's Slider support is minimul. There is no easy way as it appears to
//have customized thumb image without building a UISider object and using that
//instead. Nuts.

struct SwiftUISliders: View {
    @State var rotation: Double = 0
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            HStack{
                Image(systemName: "sun.min").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Slider(value: $rotation, in: 0...360, onEditingChanged: { editing in
                    isEditing = editing
                }).accentColor(.red)
                Image(systemName: "moon.stars").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            Text("Value: \(rotation, specifier: "%.2f°")")
                .rotationEffect(.degrees(rotation), anchor: .center)
                .foregroundColor(isEditing ? .red : .blue)
            
            
            Slider(value: $rotation, in: 0...360).accentColor(.green)
                .rotationEffect(.degrees(90.0),anchor: .center)
            
        }.navigationBarTitle("Sliders", displayMode: .inline)
        .padding()
        
    }
}

struct SwiftUISliders_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISliders()
    }
}
