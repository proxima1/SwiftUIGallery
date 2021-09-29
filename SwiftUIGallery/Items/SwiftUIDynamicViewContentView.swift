// SwiftUIDynamicViewContentView: the modifiable
// list. Sweep an item left, and  "delete" item
// shows

////
///
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

struct SwiftUIDynamicViewContentView: View {
    
    @State var editMode: EditMode = .inactive // #1
    
    @State private var moonWalkers = [
        "Armstrong",
        "Aldrin",
        "Conrad",
        "Bean",
        "Shepard",
        "Mitchell",
        "Scott",
        "Irwin",
        "Young",
        "Duke",
        "Cernan",
        "Schmitt"
    ]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(
                    moonWalkers,
                    id: \.self
                ) { walkers in
                    Text(walkers)
                }
                .onDelete { self.deleteMoonwalkers(at :$0) }
                .onMove   { self.moveMoonwalkers(from: $0, to: $1) }
            }
        }
        .navigationBarTitle("Moonwalkers", displayMode: .inline)
        .navigationBarItems(trailing: EditButton())
        
        // Go here to understand  this line used turn on the editing
        // buttons on the left side of the list items
        //            https://medium.com/geekculture/swiftui-and-the-intermittent-editmode-b714c923f536
        .environment(\.editMode, $editMode) //#2
    }
    
    //this is from Apple's docs for EditButton
    
    func insert() {
    }
    
    func deleteMoonwalkers(at offsets: IndexSet) {
        moonWalkers.remove(atOffsets: offsets)
    }
    
    func moveMoonwalkers(from source: IndexSet, to destination: Int) {
        print("Item moved from \(source) to \(destination)")
    }
    
    func inserted(index: Int, provider: [NSItemProvider]) {
        print("Doesn't seem to get called")
    }
}

struct SwiftUIDynamicViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDynamicViewContentView()
    }
}
