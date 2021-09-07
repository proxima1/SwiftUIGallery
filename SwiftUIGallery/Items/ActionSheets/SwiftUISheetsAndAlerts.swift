//
//  SwiftUISheetsAndAlerts.swift
//  SwiftUIGallery
//
//  Created by mike on 9/2/21.
//

import SwiftUI

struct ShadowStyle: ViewModifier
{
    func body(content: Content)->some View
    {
        return content
            .frame(width:220,height:40)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(40)
            .shadow(color: Color.black.opacity(0.4),radius: 8, x: 4, y: 4)
    }
}

struct SwiftUISheetsAndAlerts: View {
    
    @State var showActionSheet = false
    @State var showPopover = false
    @State var showSheet = false
    @State var showAlert = false
    @State var hideStatusBar = true
    
    var paddingInset: CGFloat = 10
    
    var body: some View {
        
    VStack{
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
                    Text("Item 3").bold().foregroundColor(.red)
                }.padding(1)
            }
            
            Button(action:{
                print("hit Action")
                showActionSheet=true
            }){
                Text("Action!!!!").bold().modifier(ShadowStyle())
            }.padding(paddingInset)
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
            }.padding(paddingInset)
            .sheet(isPresented: $showSheet){
                SwiftUIForms()
            }
            
            Button(action:{
                print("hit Alert")
                showAlert=true
            }){
                Text("Alert").bold().modifier(ShadowStyle())
            }.padding(paddingInset)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Look Behind You1"),
                    message: Text(
                        "Made you look, didn't I?"
                    )
                )
            }
        }
    }
}

struct SwiftUISheetsAndAlerts_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISheetsAndAlerts()
    }
}
