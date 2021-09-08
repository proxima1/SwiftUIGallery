//
//  SwiftUISteppers.swift
//  SwiftUIGallery
//
//  Created by mike on 8/11/21.
//

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
