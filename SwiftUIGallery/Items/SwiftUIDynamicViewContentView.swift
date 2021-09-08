//
//  SwiftUIDynamicViewContentView.swift
//  SwiftUIGallery
//
//  Created by mike on 8/18/21.
//

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

//        Go here to understand  this line:
//            https://medium.com/geekculture/swiftui-and-the-intermittent-editmode-b714c923f536
        .environment(\.editMode, $editMode) //#2

//        .toolbar {
//            EditButton()
//        }
    }

    //this is from Apple's docs for EditButton
    
func insert() {
//    let string = NSString("Item 3")
//    let provider = NSItemProvider(object: string)
//    print(provider) //output: {types = ("public.utf8-plain-text")}
//    data.items.insert(string, at: 1)
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
