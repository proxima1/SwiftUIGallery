
//  SwiftUISheetsAndAlerts

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

struct ShadowStyle: ViewModifier
{
    func body(content: Content)->some View
    {
        return content
            .frame(width:240,height:40)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(40)
            .padding()
            .shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.white)

    }
}

struct SwiftUISheetsAndAlerts: View {
    
    @State var showActionSheet = false
    @State var showPopover = false
    @State var showSheet = false
    @State var showAlert = false
    @State var hideStatusBar = true
    
    @State private var showingSheet = false
    
    var paddingInset: CGFloat = 10
    
    var body: some View {
        
        VStack{
            Button(action:{
                showingSheet=true
            }){
                Text("Sheet with Detents (iOS 16)")
            }
            .sheet(isPresented: $showingSheet) {
                SheetView().presentationDetents([.height(350),.medium, .large])
                Text("Detented Sheet (ios16)").bold()
            }.modifier(ShadowStyle())

            Button(action:{
                print("hit Popover")
                showPopover=true
            }){
                Text("Popover").bold().modifier(ShadowStyle())
            }
            .popover(

                isPresented: self.$showPopover,
                arrowEdge: .bottom
            ) {

                Button(action:{
                    print("hit 1")
                }){
                    Text("Item 1").bold()
                }.padding(1)
                
                Button(action:{
                    print("hit 2")
                }){
                    Text("Item 2").bold()
                }.padding(1)
                
                Button(action:{
                    print("hit 3")
                }){
                    Text("Item 3").bold()
                }.padding(1).foregroundColor(.red)
            }
            
            Button(action:{
                print("hit Action")
                showActionSheet=true
            }){
                Text("Action!!!!").bold().modifier(ShadowStyle())
            }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Do you like Pie?"),
                                message: Text("Choose a Favorite Pie"),
                                buttons: [
                                    .cancel(),
                                    .destructive(
                                        Text("Add to favorites")
                                    ),
                                    .default(
                                        Text("Create new pie group")
                                    )
                                ]
                    )
                }
            
            Button(action:{
                print("hit Slideover")
                showSheet=true
            }){
                Text("Slideover Sheet").bold().modifier(ShadowStyle())
            }
                .sheet(isPresented: $showSheet){
                    SwiftUIForms()
                }
            
            Button(action:{
                print("hit Alert")
                showAlert=true
            }){
                Text("Alert").bold().modifier(ShadowStyle())
            }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Look Behind You1"),
                        message: Text(
                            "Made you look, didn't I?"
                        )
                    )
                }
        }.navigationBarTitle("Sheets and Alerts", displayMode: .inline)
    }
}

struct Detents: View {
    var body: some View {
        Text("Detents of 200, middle, large")
    }
}

struct SwiftUISheetsAndAlerts_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISheetsAndAlerts()
    }
}
