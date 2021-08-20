//
//  SwiftUIDynamicViewContentView.swift
//  SwiftUIGallery
//
//  Created by mike on 8/18/21.
//

import SwiftUI

struct SwiftUIDynamicViewContentView: View {
    

    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(
                    fruits,
                    id: \.self
                ) { fruit in
                    Text(fruit)
                }
                .onDelete { self.deleteFruit(at :$0) }
                .onMove { self.moveFruit(from: $0, to: $1) }
            }
            .navigationTitle("Fruits")
            .toolbar { EditButton() }
        }
    }

    //this is from Apple's docs for EditButton
    
func insert() {
//    let string = NSString("Item 3")
//    let provider = NSItemProvider(object: string)
//    print(provider) //output: {types = ("public.utf8-plain-text")}
//    data.items.insert(string, at: 1)
  }
  
  func deleteFruit(at offsets: IndexSet) {
    fruits.remove(atOffsets: offsets)
  }
  
  func moveFruit(from source: IndexSet, to destination: Int) {
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
