// SwiftUIButtons:

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
import AVKit

struct SwiftUIButtons: View {
    @State var newText:String = "(empty)"
    
    var body: some View {
        VStack{
            
            //a SwiftUI view can only handle up to 10 subviews, otherwise
            //it breaks seemingly at random.
            
            Group{
                Spacer()
                
                simpleButton(labelText: "SimpleButton")
                
                Spacer()
                
                filledSimpleButton(labelText: "Filled button")
                
                Spacer()
                
                classyButton(labelText: "Classy button")
                
                Spacer()
                
                //                largeButton(labelText: "largeButton (iOS15)")
            }
            
            Group{
                
                buttonWithSystemImage(labelText: "Button with system image and text", imageName:"moon.stars.fill")
                
                Spacer()
                
                buttonWithCustomImage(imageName: "Compass.DistantSuns")
                
                Spacer()
                
                roundButtonWithCustomImage(imageName: "Compass.DistantSuns")
                
                Spacer()
                
//                //just upgraded to iOS15/XC13 but this cannot find the
//                //promised location button with this snippet
//                //straight from Apples doc.
//                LocationButton(.currentLocation) {
//                  // Fetch location with Core Location.
//                }
//                .symbolVariant(.fill)
//                .labelStyle(.titleAndIcon)
            }
        }.navigationTitle("Buttons")
    }
}

struct simpleButton: View {
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("Hit Label Button")
        }){
            Text(labelText).foregroundColor(.red).bold()
        }
    }
}

struct filledSimpleButton: View {
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("hit \n(labelText)")
        }){
            Text(labelText).foregroundColor(.white).bold().padding().background(Color.accentColor).cornerRadius(40)
        }
    }
}

struct classyButton: View {
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("hit \n(labelText)")
        }){
            Text(labelText)
                .foregroundColor(.black).bold().padding()
                .frame(width:200,height:50)
                .background(Color.white)
                .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
        }
    }
}

struct buttonWithSystemImage: View {
    
    //image is in assets
    
    var labelText: String
    var imageName: String
    
    var body: some View {
        Button(action:{
            print("Hit Button")
        })	{
            HStack(spacing: 10) {
                Image(systemName: imageName)
                Text(labelText)
            }.frame(minWidth:frame(minWidth: 100, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center) as? CGFloat)
        }
    }
}

struct buttonWithCustomImage: View {
    
    //image is in assets
    
    var imageName: String
    
    var body: some View {
        Button(action:{
            print("Hit Button")
        })	{
            Image(imageName)
                .resizable()
                .foregroundColor(.blue)
                .opacity(1.0)
                .scaledToFill()
                .frame(width:60, height:60,alignment:.center)
                .shadow(color: Color.black.opacity(0.7),radius: 7, x: 5, y: 6)
        }
    }
}

struct roundButtonWithCustomImage: View {
    
    //image is in assets
    var synthesizer = AVSpeechSynthesizer()
    var imageName: String
    
    var body: some View {
        Button(action:{
            print("Hit Round Button")
            let utterance = AVSpeechUtterance(string: "hit roundbutton")
            synthesizer.speak(utterance)
            synthesizer.usesApplicationAudioSession = false
        })	{
            Image(imageName)
                .resizable()
                .foregroundColor(.blue)
                .opacity(1.0)
                .scaledToFill()
                .frame(width:60, height:60,alignment:.center)
        }.clipShape(Circle()).shadow(color: Color.black.opacity(0.4),radius: 7, x: 10, y: 10)
    }
}

struct separateText: View {
    var newText: String
    
    var body: some View {
        return VStack{
            Text(newText).foregroundColor(.blue)
        }
    }
}

struct SwiftUIButtons_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButtons(newText: "hello")
    }
}
