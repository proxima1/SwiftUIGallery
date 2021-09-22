//  SwiftUIBridgeUIKit : bridge between SwiftUI and UIKit

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
