//
//  SwiftUISliders.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

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
