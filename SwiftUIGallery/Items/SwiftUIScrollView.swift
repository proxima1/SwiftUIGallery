//
//  SwiftUIScrollView.swift
//  SwiftUIGallery
//
//  Created by mike on 8/16/21.
//

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
