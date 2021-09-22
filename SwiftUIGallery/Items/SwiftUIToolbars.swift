
//  SwiftUIToolbars

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

struct ItemsToolbar: ToolbarContent {
    let add: () -> Void
    let sort: () -> Void
    let filter: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Spiny Lumpsucker 👍🏻", action: add)
        }
        
        ToolbarItemGroup(placement: .bottomBar) {
            Button("Wobbegong", action: sort)
            Button(action: filter)
            {
                Text("Streaked Tenrec")  //notice all of these attributes are ignored
                    //even though we're using a button
                    .foregroundColor(.black).italic().padding()
                    .background(Color.white)
                    .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
            }
        }
    }
    
}

struct SwiftUIToolbars: View {
    @State var color = Color.red
    
    var body: some View {
        Text("Weird animal names").foregroundColor(color).toolbar
        {
            ItemsToolbar {
                print("Spiny Lumpsucker")
                color = Color.red
            } sort: {
                print("Tasselled Wobbegong")
                color = Color.blue
            } filter: {
                print("Streaked Tenrec")
                color = Color("DarkGreen")
            }
        }.navigationBarTitle("ToolBars", displayMode: .inline)
    }
}

struct SwiftUIToolbars_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToolbars()
    }
}
