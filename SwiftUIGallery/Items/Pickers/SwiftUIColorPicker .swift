//
//  SwiftUIColorPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

struct SwiftUIColorPicker: View {
    
    @State var labelText = "color picker"
    @State private var selectedColor =
        Color(.sRGB, red: 0.1, green: 0.5, blue: 1.0)
    
    var body: some View {
        
        VStack{
            
            Circle()
                .fill(selectedColor)
                .frame(width: 200, height: 200, alignment: .top)
            
            Spacer()
            Spacer()
            Spacer()

            Text("Color Picker Demo").foregroundColor(selectedColor).font(.largeTitle)
            
            ColorPicker("Pick Your Color", selection: $selectedColor).frame(maxWidth: 200.0, maxHeight: 150.0)
            
            Spacer()
        }
    }
}

struct SwiftUIColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIColorPicker()
    }
}
