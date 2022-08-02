// SwiftUILinks

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

struct SwiftUILinks: View {
    var body: some View {
        
        //iOS 15/XC 13 way, using markdown in the next field
        //Text("[Stackoverflow](https://stackoverflow.com)")
       
        NavigationView(){
            VStack{
                Spacer()
                Text("URL")
                HStack{
                    Link("🔗  Distant Suns trailer",
                         destination: URL(string: "https://www.youtube.com/watch?v=2zeN63hZaFQ")!).font(.system(size: 35.0,weight:.light))
                }
                
                let destination = SwiftUISliders()
                Divider()
                Text("Navigation Link")
                NavigationLink(
                    destination: destination
                )
                {
                    Text("show slider page").font(.system(size: 35.0,weight: .light))
                }
                
                Divider()
                
                Text("Share Links (ios16)")
                HStack{
                    Link("🔗  Share",
                         destination: URL(string: "https://www.youtube.com/watch?v=2zeN63hZaFQ")!).font(.system(size: 35.0,weight:.light))
                }
                Spacer()
            }
        }.navigationBarTitle("Links", displayMode: .inline)
        
    }
}

struct SwiftUILinks_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILinks()
    }
}
