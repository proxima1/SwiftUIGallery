//
//  SwiftUISteppers.swift

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

let colors: [Color] = [.orange, .red, .gray, .blue,
                       .green, .purple, .pink]

struct SwiftUISteppers: View {
    @State var stepperValue: Int = 0
    @State var colorStepperValue: Int = 0
    
    var body: some View {
        VStack {
            Form{
                
                //note that the values use the same stepperValue so both
                //will change
                
                Section(header:Text("Simple").font(.headline)){
                    Stepper("Plain: \(stepperValue)", value: $stepperValue)
                    Stepper("Value -4 to +4: \(stepperValue)", value: $stepperValue, in: -4...4)
                    Stepper("Increments of 3 : \(stepperValue)", value: $stepperValue, step:3)
                        .background(Capsule().stroke(Color.red, lineWidth: 1).scaleEffect(1.1))
                }.padding(2.0)
                
                Section(header:Text("Not so simple").font(.headline)){
                    Stepper(" Value: \(colorStepperValue) Color: \(colors[colorStepperValue].description)",
                            onIncrement: incrementStep,
                            onDecrement: decrementStep) {value in
                        //tbis is for the closure onEditingChanged. It's called at
                        //the start and end of an editing sequence. Here, it is called
                        //by a downclick, then again on the release, which could be seconds apart
                        print("got \(colorStepperValue), value is changed \(value)")
                    }.background(colors[colorStepperValue])
                }
            }.padding(2).navigationBarTitle("Steppers", displayMode: .inline)
        }
    }
    
    func incrementStep() {
        colorStepperValue += 1
        if colorStepperValue >= colors.count { colorStepperValue = 0 }
    }
    
    func decrementStep() {
        colorStepperValue -= 1
        if colorStepperValue < 0 { colorStepperValue = colors.count - 1 }
    }
}

struct SwiftUISteppers_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISteppers()
    }
}
