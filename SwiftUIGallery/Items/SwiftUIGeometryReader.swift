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

struct SwiftUIGeometryReader: View {
    
    var body: some View {
        GeometryReader { geometry in
            Color.orange
                .frame(
                    width: geometry.size.width / 2,
                    height: geometry.size.height / 2
                )
            Text("width:  \(geometry.size.width , specifier: "%.1f")")
                .frame(width:200,height:20,alignment: .center)
                .background(Color.red)
                .position(x:geometry.size.width/2.0,y:geometry.size.height/4.0)
            Text("height:  \(geometry.size.height , specifier: "%.1f")")
                .frame(width:200,height:20,alignment: .center)
                .background(Color("DustyBlue"))
                .position(x:geometry.size.width/2.0,y:20+geometry.size.height/4.0)
        }
    }
}

struct SwiftUIGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGeometryReader()
    }
}
