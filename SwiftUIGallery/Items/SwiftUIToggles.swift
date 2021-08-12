//
//  SwiftUIToggles.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

import SwiftUI

struct SwiftUIToggles: View {
    @State var isToggled: Bool = true
    
    var body: some View {
        VStack {
            Text("AA: Toggle Me First!")
                .foregroundColor(isToggled ? .green : .gray)
            Toggle("Toggle", isOn: $isToggled)
                .labelsHidden()
            
            Text("BB: Toggle Me Second!")
                .foregroundColor(isToggled ? .blue : .red)
            Toggle("Toggle", isOn: $isToggled)
                .labelsHidden()
            
            customToggle(isOn:$isToggled, checktitle: "howdy").padding()
            
        }.padding()
        .navigationBarTitle("toggles", displayMode: .inline)
        .frame(maxWidth: 250).overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: isToggled ? 4 : 2)
                .foregroundColor(isToggled ? .green : .orange)
        )
    }
}

struct customToggle: View
{
    @Binding var isToggledOn: Bool
    var title: String = ""
    
    init(isOn: Binding<Bool>, checktitle: String){
        _isToggledOn=isOn
        self.title=checktitle
    }
    
    var body: some  View
    {
        HStack{
            Text("Check").foregroundColor(Color.black).frame(maxWidth: .infinity,alignment: .trailing)
                
            Toggle(isOn: _isToggledOn){
                
            }.frame(maxWidth: 200,alignment: .leading)
            .onChange(of: isToggledOn) {_ in
                print("toggle on")
            }.toggleStyle(CheckboxToggleStyle()).font(.system(size: 20.0,weight: .light))
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
     func makeBody(configuration: Configuration) -> some View {
          return HStack {
                configuration.label

            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable().scaledToFit()
                .frame(width: 25, height: 25, alignment: .trailing)
                .onTapGesture { configuration.isOn.toggle() }
                .foregroundColor(Color.blue)
          }
     }
}

struct SwiftUIToggles_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToggles()
    }
}
