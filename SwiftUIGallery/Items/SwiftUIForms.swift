// SwiftUIForms: very nice an powerful system

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

struct SwiftUIForms: View {
    
    let apolloPatches = ApolloPatches().apolloPatches
    @State private var selectedFrameworkIndex = 0
    @State private var apolloPatch = "Apollo 13"
    @State private var isToggled = false
    
    var body: some View {
        VStack {
            
            //the InlinePicker is the default when adding to a form.
            //PickerStyle can be used for other types. Interestingly enough
            //specifying the InlinePickerStyle() forces the use of
            //the Wheels. I think this a product of how a type of picker
            //can be overriden by a system default. Doesn't make sense here.
            
            Form {
                
                Section(header: Text("Toggles")){
                    toggles(isOn: $isToggled)
                }
                
                Section(header: Text("Popup menu picker")) {
                    menuPicker($apolloPatch)
                }
                
                Section(header: Text("Tumbler Picker"))
                {
                    tumblerPicker($apolloPatch)
                }
                
                Section(header: Text("Links"))
                {
                    Link("🔗  Distant Suns trailer",
                         destination: URL(string: "https://www.youtube.com/watch?v=2zeN63hZaFQ")!).font(.system(size: 20.0,weight:.regular))
                }
            }
            
        }.navigationBarTitle("Form-a-pa-looza!", displayMode: .inline)
    }
}

struct toggles: View
{
    @Binding var isToggledOn: Bool
    var title: String = ""
    
    init(isOn: Binding<Bool>){
        _isToggledOn=isOn
    }
    
    var body: some  View
    {
        HStack{
            Toggle("Toggle Me First!", isOn: $isToggledOn)
        }
        
        HStack{
            Toggle("Toggle Me Second!", isOn: $isToggledOn)
        }
    }
}

struct menuPicker: View
{
    let apolloPatches = ApolloPatches().apolloPatches
    //    @State private var selectedPatchIndex = 6
    @Binding var apolloPatch: String
    
    var title: String = ""
    
    init(_ patch: Binding<String>){
        _apolloPatch=patch
    }
    
    var body: some  View{
        
        Picker("Select Patch: ",selection: $apolloPatch){
            ForEach(apolloPatches, id: \.self){

                let tempText = Text($0)
                let tempImage = Image($0).resizable().frame(width:20,height:20,alignment:.leading)

                HStack{
                    tempImage.frame(width: 30, height: 30, alignment: .center)
                    tempText.padding(EdgeInsets(top:0, leading:20.0, bottom:0.0, trailing:10.0))
                }
            }
        }.pickerStyle(MenuPickerStyle())
        
        HStack{
            Text("My favorite Apollo patch is \(apolloPatch)").foregroundColor(Color.red).fontWeight(.regular).font(.system(size: 15.0))
            Image(apolloPatch).resizable().frame(width:30,height:30,alignment:.center)
        }
    }
}

struct tumblerPicker: View
{
    var title: String = ""
    let apolloPatches = ApolloPatches().apolloPatches
    @Binding var apolloPatch: String
    
    init(_ patch: Binding<String>){
        _apolloPatch=patch
    }
    
    var body: some  View
    {
        HStack{
            Text("My favorite Apollo patch is \(apolloPatch)").fontWeight(.regular).font(.system(size: 15.0))
            Image(apolloPatch).resizable().frame(width:20,height:20,alignment:.center)
        }
        
        Picker("This Shouldnt show",selection: $apolloPatch){
            ForEach(apolloPatches.reversed(), id: \.self)
            {
                let patchName = Text($0)
                let patchImage = Image($0).resizable().frame(width:20,height:20,alignment:.leading)
                
                //Note that I can't use something like Text($0) in an HStack
                //as I get the error Contextual closure type '() -> TupleView<...>' expects 0 arguments, but 1 was used in closure body error show
                //The $0 is a value passed as an argument (apparently) and HStack takes no arguments.
                //By assigning the values above we now have accessable properties that
                //can be used instead.
                
                HStack{
                    patchName
                    patchImage
                }
            }
        }.accentColor(.red).padding().pickerStyle(WheelPickerStyle())
    }
}

struct SwiftUIForms_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIForms()
    }
}
