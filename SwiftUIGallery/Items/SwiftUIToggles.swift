
//  SwiftUIToggles

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

struct SwiftUIToggles: View {
    @State var isToggled: Bool = true
    
    var body: some View {
        VStack {
            Text("A: Toggle Me First!")
                .foregroundColor(isToggled ? .green : .gray)
            Toggle("Toggle", isOn: $isToggled)
                .labelsHidden()
            
            Text("B: Toggle Me Second!")
                .foregroundColor(isToggled ? .red : .blue)
            Toggle("Toggle", isOn: $isToggled)
                .labelsHidden()
            
            Text("C: Mutli-level toggle. ios16!")
                .foregroundColor(isToggled ? .blue : .red)
            Toggle("Toggle", isOn: $isToggled)
                .labelsHidden()
            
            customToggle(isOn:$isToggled, checktitle: "howdy").padding()
            
        }.padding()
        .navigationBarTitle("Toggles", displayMode: .inline)
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
