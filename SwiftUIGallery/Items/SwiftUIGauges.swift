//
//  SwiftUIGauges.swift
//  SwiftUIGallery
//
//  Created by mike on 4/11/23.
//

// based on the examples at : https://sarunw.com/posts/swiftui-gauge/

import SwiftUI

struct SwiftUIGauges: View {
    
    var body: some View {
        VStack{
            
            Form
            {
//                Section("Progress vs. Gauge")
//                {
//                    simpleProgressView()
//                }+
//                Section("Adding Value")
//                {
//                    notAsSimpleGauge()
//                }
                          
//                Text("Thx to sarunw.com for these examples").frame(maxWidth: .infinity, alignment: .center).foregroundColor(.gray)

                Section("Style")
                {
                    
//                    Text("Style.linearCapacity")

                    gaugeWithStyle(style: .linearCapacity, styleName: "Style.linearCapacity")
                    
//                    Text("Style.accessoryLinear")
                    
                    gaugeWithStyle(style: .accessoryLinear, styleName: "Style.accessoryLinear")

//                    Text("Style.accessoryLinearCapacity")
                                        
                    gaugeWithStyle(style: .accessoryLinearCapacity, styleName: "Style.accessoryLinearCapacity")
                    
//                    Text("Style.accessoryCircular")

                    gaugeWithStyle(style: .accessoryCircular, styleName: "Style.accessoryCircular")
                    
//                    Text("Style.accessoryCircularCapacity")

                    gaugeWithStyle(style: .accessoryCircularCapacity, styleName: "Style.accessoryCircularCapacity")
                }
                
                Section("Custom")
                {
                    gaugeWithStyle(style: customGaugeStyle(), styleName:"")
                    Text("Thx to AppCoda for this example")
                        .frame(maxWidth: .infinity, alignment: .center).foregroundColor(.gray)
                }
            }
        }
    }
}

struct simpleProgressView: View{
    
    @State private var speed = 0.60

    var body: some View {
        VStack {
            Text("Speed")
            
            ProgressView(value: speed) {
                
                Text("Progress")
            }
            Gauge(value: speed) {
                
                Text("Gague")
            }
        }.padding(EdgeInsets(top:0, leading:20.0, bottom:0.0, trailing:20.0))
        
    }
}

struct notAsSimpleGauge: View{
    
    @State private var speed = 0.60

    var body: some View{
        Gauge(value: speed, in: 0...250) {
            
            Text("Speed")
        } currentValueLabel: {
            Text(Int(speed), format: .number)
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("250")
            //        }.padding(EdgeInsets(top:0, leading:20.0, bottom:0.0, trailing:20.0))
        }.padding(10.0)
    }
}

struct  gaugeWithStyle<G>: View where G: GaugeStyle{
    
    @State private var fahrenheit = 32.0
    
    private let minValue = 32.0
    private let maxValue = 212.0
    let style: G
    let styleName: String
    
    let gradient = Gradient(colors: [.blue, .green, .yellow, .pink])
    
//    init(style: G = .accessoryLinear, styleName: String){
//        self.style = style
//        self.styleName = styleName
//    }
    
    init(style: G = .accessoryLinear, styleName: String){
        self.style = style
        self.styleName = styleName
    }
    
    var body: some View {
        Text(styleName).frame(maxWidth: .infinity, alignment: .center).foregroundColor(.gray).font(.system(size: 12.0))

        VStack {
            
            Gauge(value: fahrenheit, in: minValue...maxValue) {
                Label("Temperature (°F)", systemImage: "thermometer.medium")
            } currentValueLabel: {
                Text(Int(fahrenheit), format: .number)
            } minimumValueLabel: {
                Text("32")
            } maximumValueLabel: {
                Text("212")
            }.gaugeStyle(self.style).tint(gradient)

            
            Gauge(value: fahrenheit, in: minValue...maxValue) {
                Label("Temperature (°F)", systemImage: "thermometer.medium")
                
            }.tint(gradient)
            
            Slider(value: $fahrenheit, in: minValue...maxValue).tint(gradient)
        }
        .gaugeStyle(.accessoryLinear)
        
        .padding()
    }
}

// thanks to appcoda.com for this example

struct CustomGaugeView: View {
 
    @State private var currentSpeed = 140.0
 
    var body: some View {
        Gauge(value: currentSpeed, in: 0...200) {
            Image(systemName: "gauge.medium")
                .font(.system(size: 50.0))
        } currentValueLabel: {
            Text("\(currentSpeed.formatted(.number))")
 
        }
        .gaugeStyle(customGaugeStyle())
    }
}

struct customGaugeStyle: GaugeStyle {
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)

    func makeBody(configuration: Configuration) -> some View {
        ZStack {

            Circle()
                .foregroundColor(Color(.systemGray6))

            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(purpleGradient, lineWidth: 20)
                .rotationEffect(.degrees(135))

            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [1, 34], dashPhase: 0.0))
                .rotationEffect(.degrees(135))

            VStack {
                configuration.currentValueLabel
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                Text("FpF")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.gray)
            }

        }
        .frame(width: 300, height: 300)

    }

}
struct SwiftUIGauges_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGauges()
    }
}
