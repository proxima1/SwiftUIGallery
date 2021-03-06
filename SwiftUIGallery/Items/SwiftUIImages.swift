// SwiftUIImages: all ways to use and misuse image

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

// Inspiration from: https://serialcoder.dev/text-tutorials/swiftui/swiftui-clip-shape-modifier-on-images/
//

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("Mr. Higgs")
                .font(.callout)
                .font(.system(size: 20, weight: .bold, design: .serif))
                .padding(6)
                .foregroundColor(.white)
                .background(Color.blue)
        }
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct rotationStyle: ViewModifier
{
    var newAngle = 0.0
    
    init(angle: Double)
    {
        newAngle=angle
    }
    
    func body(content: Content)->some View
    {
        return content
            .rotationEffect(Angle(degrees: newAngle),anchor: .center)
    }
}

import SwiftUI

struct SwiftUIImages: View {
    
    enum ShapeType: String, Shape, CaseIterable {
        case rectangle = "Rectangle"
        case rounded = "Rounded Rectangle"
        case circle  = "Circle"
        case ellipse = "Ellipse"
        case capsule = "Capsule"
        case diamond = "Diamond"
        
        func path(in rect: CGRect) -> Path {
            
            switch self {
            case .circle: return Circle().path(in: rect)
            case .ellipse: return Ellipse().path(in: rect)
            case .capsule: return Capsule().path(in: rect)
            case .rounded: return RoundedRectangle(cornerRadius: 25.0).path(in: rect)
            case .rectangle: return Rectangle().path(in: rect)
            case .diamond: return Diamond().path(in: rect)
            }
        }
    }
    
    //register all of the attributs of Image, as $State vars.
    //that way whenever one of those change from a menu or tumbler
    //selection the image will be updated.
    
    @State private var shape: ShapeType = .circle
    @State private var color: Color = .white        //normal
    @State private var image: HiggsImage = HiggsImage()
    @State private var imgContrast = 1.0            //1.0 is normal
    @State private var angle = 0.0
    @State private var inverse = false
    @State private var saturation = 3.5
    @State private var xOffset = 0.0
    @State private var scale = CGFloat(1.0)
    @State private var damping = 0.85
    
    var body: some View {
        //shape choices here:
        // https://developer.apple.com/documentation/swiftui/shape#relationships
        
        VStack{
            Spacer()
            
            ZStack{
                
                //allows the updated attribute to animate.
                
                withAnimation {
                    
                    image.colorMultiply(color)
                        .overlay(ImageOverlay(), alignment: .center)
                        .clipShape(shape)
                        .contrast(imgContrast)
                        .modifier(rotationStyle(angle: angle))
                        .saturation(saturation)
                        .scaleEffect(scale)
                        .offset(x: CGFloat(xOffset))
                        
                        //uses a custom <if> (see above)
                    
                        .if(inverse) {                            view in
                            // We only apply this background color if shouldApplyBackground is true
                            view.colorInvert()
                        }
                }
            }
            
            Picker("Shape Type: ",selection: $shape){
                
                ForEach(ShapeType.allCases, id: \.self){shapeType in
                    Text(shapeType.rawValue)
                }
            }.pickerStyle(WheelPickerStyle())
            
            Spacer()
            
            Menu("Actions"){
                
                Section{
                    
                    Button(){
                        
                        //"response" actually means "duration" here,
                        //not quite sure about the difference
                        
                        withAnimation(.spring(response: 0.75,dampingFraction: damping)) {
                            color = .white
                            imgContrast = 1.0
                            angle = 0.0
                            inverse = false
                            saturation = 3.5
                            xOffset = 0.0
                            scale=1.0
                        }
                        
                    }label: {
                        Text("Reset")
                    }
                }
                
                Section{
                    Button(){
                        withAnimation {
                            xOffset = 50.0
                        }
                    }label: {
                        Text("Offset")
                    }
                    
                    Button(){
                        withAnimation {
                            scale=0.2
                        }
                    }label: {
                        Text("Shrink")
                    }
                    
                    Button(){
                        withAnimation {
                            scale=2.0
                        }
                    }label: {
                        Text("Grow")
                    }
                    
                    Button(){
                        angle = 90.0
                    }label: {
                        Text("Rotate: 90")
                    }
                    
                    Button(){
                        withAnimation {
                            angle = 180.0
                        }
                    }label: {
                        Text("Rotate: 180")
                    }
                }
                
                Section()
                {
                    Button(){
                        withAnimation {
                            damping = 0.2
                        }
                    }label: {
                        Text("Large damping")
                    }
                    
                    Button(){
                        withAnimation {
                            damping = 0.7
                        }
                    }label: {
                        Text("Little damping")
                    }
                }
                Section()
                {
                    Button(){
                        withAnimation {
                            imgContrast = 2.5
                        }
                    }label: {
                        Text("High Contrast")
                    }
                    
                    Button(){
                        withAnimation {
                            imgContrast = 0.25
                        }
                    }label: {
                        Text("Low Contrast")
                    }
                    
                    Button(){
                        withAnimation {
                            saturation = 0.0
                        }
                    }label: {
                        Text("Black and White")
                    }
                    
                    Button(){
                        withAnimation {
                            color = .red
                        }
                    }label: {
                        Text("Red")
                    }
                    
                    Button(){
                        withAnimation {
                            color = .blue
                        }
                    }label: {
                        Text("Blue")
                    }
                    
                    Button(){
                        withAnimation {
                            inverse = true
                        }
                    }label: {
                        Text("Inverse")
                    }
                }
                
                
            }
            .font(.custom("Helvetica", size: 20))
            
            Spacer()
            
        }.navigationBarTitle("Images", displayMode: .inline)
    }
}

struct HiggsImage: View{
    var body: some View
    {
        Image("Ragdoll")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .saturation(0.3)
            .frame(width: 250.0, height: 300.0, alignment: .center)
    }
}

struct Diamond: Shape{
    func path(in rect: CGRect) -> Path{
        var path=Path()
        
        let size = rect.width/2.0
        let pointLeft = CGPoint(x: 0.0, y: size)
        let pointTop = CGPoint(x: size, y: 0.0)
        let pointRight = CGPoint(x: size*2.0, y: size)
        let pointBottom = CGPoint(x: size, y: size*2.0)
        
        path.move(to: pointLeft)
        path.addLine(to: pointTop)
        path.addLine(to: pointRight)
        path.addLine(to: pointBottom)
        
        return path
    }
}

struct SwiftUIImages_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUIImages()
        }
    }
}
