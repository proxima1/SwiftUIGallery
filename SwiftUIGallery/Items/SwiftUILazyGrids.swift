//
//  SwiftUILazyGrids.swift
//  SwiftUIGallery
//
//  Created by mike on 9/7/21.
//

import SwiftUI

struct SwiftUILazyGrids: View {
    
    private var vspace : CGFloat = 15.0
    
//    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    private let columns = [GridItem(.fixed(200)), GridItem(.flexible()), GridItem(.flexible())]
//    private let columns = [GridItem(.adaptive(minimum: 200))]
//    private let columns = [GridItem(.fixed(100)), GridItem(.adaptive(minimum: 50))]
    var body: some View {
        NavigationView() {
            ScrollView {
                LazyVGrid(columns: columns, spacing:vspace) {
                    ForEach((0...79), id: \.self) {
                        
                        let codepoint = $0 + 0x1f600
                        let codepointString = String(format: "%02X", codepoint)
                        
                        Text("\(codepointString)")
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color("AccentColor")).cornerRadius(10.0)
                        
                        let emoji = String(Character(UnicodeScalar(codepoint)!))
                        
                        Text("\(emoji)")
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color("DarkRed")).cornerRadius(10.0)
                        
                        Text("\(emoji)")
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color("Greenish")).cornerRadius(10.0)
                    }
                }.font(.largeTitle)
            }
            .navigationBarTitle("Lazy Grids")
        }
        
    }
}

struct SwiftUILazyGrids_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUILazyGrids()
            SwiftUILazyGrids()
        }
    }
}
