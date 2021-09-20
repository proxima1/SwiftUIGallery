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

class timer: ObservableObject{
    @Published var countingValue = 0.0
    var counter = 0.0
    
    init()
    {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true){timer in
            self.counter+=0.5
            self.counter=(self.counter>100.0) ? 0.0 : self.counter
            self.countingValue=self.counter
        }
    }
}

struct CustomCircularProgressViewStyle: ProgressViewStyle{
    func makeBody(configuration: Configuration) -> some View{
        ZStack{
            Circle().trim(from: 0.0, to: 1.0)
                .stroke(Color.white,style: StrokeStyle(lineWidth: 20))
                .shadow(radius: 15.0 )
                
                //use this to animate the shadow's radius from 0 to 15
                //                .shadow(radius: CGFloat(configuration.fractionCompleted!)*15.0 )
                
                .rotationEffect(.degrees(-90))
                .frame(width:100, height: 100).padding()
            
            Circle().trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color(.sRGB, red:0.6 ,green:0.7,blue:0.9),style: StrokeStyle(lineWidth: 10,  lineCap: .round, lineJoin: .round)).opacity(1)
                .rotationEffect(.degrees(-90))
                .frame(width: 100,height:100)
                .shadow(radius:10)
            
            if let fractionCompleted = configuration.fractionCompleted {
                Text(fractionCompleted < 1 ?
                        "\(Int((configuration.fractionCompleted ?? 0) * 100)) %" : "Done")
                    .fontWeight(.regular)
                    .opacity(0.8)
                    .foregroundColor(fractionCompleted < 1 ? .purple : .orange)
            }
        }.navigationBarTitle("Progress Views", displayMode: .inline)
    }
}

struct SwiftUIProgressView: View {
    
    @State var color = Color.green
    @ObservedObject var time = timer()
    var testval  = 10.0
    
    var body: some View {
        VStack{
            Form{
                Section(header:Text("Indeterminant"))
                {
                    HStack{
                        Spacer()
                        ProgressView("Default")
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        ProgressView("With Color").progressViewStyle(CircularProgressViewStyle(tint: .green))
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        ProgressView("More Color").progressViewStyle(CircularProgressViewStyle(tint: .green)).foregroundColor(.blue)
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        ProgressView {
                            Button(action: {
                                print("got the button")
                                if color == .orange{
                                    color = .green
                                }
                                else {
                                    color = .orange
                                }
                            }) {
                                Text("Whee! A Button!")
                                    .foregroundColor(.white)
                            }
                            .padding(7)
                            .background(color)
                            .cornerRadius(10)
                        }
                        Spacer()
                    }
                }
                Section(header:Text("Determinant"))
                {
                    ProgressView("Default",value: time.countingValue,total: 100)
                    ProgressView("With color",value: 0.3).foregroundColor(.green).accentColor(.red)
                    
                    HStack{
                        Spacer()
                        Text("Custom")
                        ProgressView("Custom",value: time.countingValue,total: 100).progressViewStyle(CustomCircularProgressViewStyle())
                        Spacer()
                    }
                }
            }
        }
    }
}

struct SwiftUIProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUIProgressView()
        }
    }
}
