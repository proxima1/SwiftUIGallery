
//  SwiftUIScrollView.swift

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

struct SwiftUIScrollView: View {
    var body: some View {
        VStack{
            //            Text("LazyScroller").bold()
            Text("LazyScroller").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 24.0))
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 10) {
                    ForEach(1...100, id: \.self) {
                        Text("Column \($0)").frame(height:50).background(Color.green)
                    }
                }
            }
            
            Spacer()

            ScrollView(.vertical) {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)").frame(height:50)
                            .padding(EdgeInsets(top:0, leading:20.0, bottom:0.0, trailing:10.0))
                            .background(Color.pink)
                    }
                }
                
                Spacer()
            }
        }.navigationBarTitle("Scrolling Views", displayMode: .inline)
    }
}

struct SwiftUIScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScrollView()
    }
}
