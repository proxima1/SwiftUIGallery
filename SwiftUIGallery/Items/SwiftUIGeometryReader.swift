//
//  SwiftUIGeometryReader.swift
//  SwiftUIGallery
//
//  Created by mike on 9/9/21.
//

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
