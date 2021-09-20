//
//  SwiftUIBridgeUIKit.swift
//  SwiftUIGallery
//
//  Created by mike on 9/10/21.
//

import SwiftUI

struct testUIView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<testUIView>) -> SwiftUIHostingViewController {
        let uivc = SwiftUIHostingViewController()
        uivc.view.backgroundColor=UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1.0)
        return uivc
    }

    func updateUIViewController(_ uiViewController: SwiftUIHostingViewController, context: UIViewControllerRepresentableContext<testUIView>) {
        
        //this can be used if you embed the controller's view into this swiftUI dialog
        //as oppened to popping it up in it's own view
        
//        uiViewController.view.frame=CGRect(x: 20,y: 40,width:100,height:300)
    }
}

struct SwiftUIBridgeUIKit: View {
    @State var text = NSMutableAttributedString(string: "aaaa")
    @State private var message = ""
    @State private var showUIViewController = false

    @State private var textStyle = UIFont.TextStyle.title2
    
    var body: some View {
        VStack{
            bridgeButton(labelText: "Show ViewControllerx",isShowing: $showUIViewController)
        }
        .sheet(isPresented: $showUIViewController) {
            testUIView()
        }
    }
}

struct bridgeButton: View {
    var labelText: String
    @Binding var isShowing: Bool
    
    var body: some View {
        Button(action:{
            print("hit \n(labelText)")
            isShowing=true
        }){
            Text(labelText)
                .foregroundColor(.black).bold().padding()
                .frame(width:200,height:50)
                .background(Color.white)
                .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
        }
    }
}

struct SwiftUIBridgeUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIBridgeUIKit()
    }
}
