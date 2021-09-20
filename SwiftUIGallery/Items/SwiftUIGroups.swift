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

struct SwiftUIGroups: View {
    @State var isProfileExpanded = false
    @State var rotation: Double = 0.0
    @State var stepperValue: Int = 0
    
    let flights: [Flight] = Flight.flights
    
    var body: some View {
        Form {
            Section(header: Text("Plain Group")){
                Group{
                    Text("Apollo 7")
                    Text("Apollo 8")
                    Text("Apollo 9")
                    Text("Apollo 10...")
                }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            
            Section(header: Text("Disclosure Group")){
                DisclosureGroup(isExpanded: $isProfileExpanded) {
                    Text("MR-3")
                    Text("MR-4")
                    Text("MA-6: Friendship 7")
                    Text("MA-7: Aurora 7")
                    Text("MA-8: Sigma 7")
                    Text("MA-9: Faith 7")
                    
                    DisclosureGroup("Test"){
                        Text("third level")
                        Text("third level")
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                } label: {
                    Text("Mercury")
                        .font(.headline)
                }
                
                DisclosureGroup {
                    Text("GT-3")
                    Text("GT-4")
                    Text("GT-5")
                    Text("GT-6")
                    Text("GT-7")
                    Text("GT-8")
                    Text("GT-9")
                    Text("GT-10")
                    Text("GT-11")
                    Text("GT-12")
                } label: {
                    Text("Gemini")
                        .font(.headline)
                }
                
                DisclosureGroup{
                    Group{
                        Text("Apollo 7")
                        Text("Apollo 8")
                        Text("Apollo 9")
                        Text("Apollo 10")
                        Text("Apollo 11")
                        Text("Apollo 12")
                        Text("Apollo 13")
                        Text("Apollo 14")
                        Text("Apollo 15")
                    }
                    Group{  //note that we have to break this up in two
                        //groups, as only 10 views at a time can
                        //be hosted together. A ViewBuilder constraint
                        //but this doesn't visually show anything
                        Text("Apollo 16")
                        Text("Apollo 17")
                    }
                } label: {
                    Text("Apollo")
                        .font(.headline)
                }
            }
            
            Section(header: Text("Disclosure Group with Controls")){
                DisclosureGroup{
                    Toggle("Toggle", isOn: .constant(true))
                    
                    Button(action:{
                        print("Button")
                    }){
                        Text("Button").foregroundColor(.red).bold()
                    }
                    
                    Button(action:{
                        print("hit \n(labelText)")
                    }){
                        Text("Classy Button")
                            .foregroundColor(.black).bold().padding()
                            .background(Color.white)
                            .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 1, y: 1)
                    }
                    
                    Slider(value: $rotation, in: 0...360, onEditingChanged: { editing in
                    }).accentColor(.red)
                    
                    Link("🔗  Distant Suns trailer",
                         destination: URL(string: "https://www.youtube.com/watch?v=2zeN63hZaFQ")!).font(.system(size: 20.0,weight:.light))
                    
                    Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                    
                    Form{
                        //in theory, we should be able to put a form into
                        //a disclosure group item, but no, it doesn't work
                        
                        Section(header: Text("Section 1")){
                            Text("Objects")
                            Text("Objects")
                            Text("Objects")
                            ProgressView("Default")
                        }
                        
                        Section(header: Text("Section 2")){
                            Text("Objects")
                            Text("Objects")
                            Text("Objects")
                            ProgressView("Default")
                        }
                    }
                }label: {
                    Text("Objects")
                        .font(.headline)
                }
                
            }
            
            Section(header: Text("Outline Group")){
                flightsList()
            }
        }.navigationBarTitle("Disclousure and OutlineGroups", displayMode: .inline)
    }
}

struct flightsList: View{
    let flights: [Flight] = Flight.flights
    
    var body: some View{
        OutlineGroup(flights, children: \.children) {
            Text($0.title)
        }
    }
}

struct SwiftUIGroups_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGroups()
    }
}
