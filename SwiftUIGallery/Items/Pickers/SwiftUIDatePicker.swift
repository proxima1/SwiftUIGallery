// SwiftUIDatePicker: opens the default standard
// and very nice, Date picker

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

//original: https://www.swiftcompiled.com/swiftui-datepicker/

struct SwiftUIDatePicker: View {
    @State private var randomDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State var date: Date = Date()
    @State private var dates: Set<DateComponents> = []

    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                Text("Compact DatePicker")
                DatePicker("Date", selection: $date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .frame(height: 40)
                Spacer()
                Spacer()
                Text("Wheel DatePicker")
                DatePicker("", selection: $date)
                    .datePickerStyle(WheelDatePickerStyle())
                
                GraphicDatePickers(date: $date)

                Spacer()
            }.padding()
            .navigationTitle("Date Picker")
        }
    }
}
   
 struct GraphicDatePickers: View
{
    @State private var dates: Set<DateComponents> = []
    @Binding var date: Date

    var body: some View
    {
        VStack{
            Text("Standard DatePicker")
            DatePicker("Date Picker", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle()).accentColor(.red)
            Text("Multi-DatePicker (iOS16)")
            MultiDatePicker("Multi date-Picker", selection: $dates)
                .accentColor(.green)
        }
    }
}

struct SwiftUIDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDatePicker()
    }
}
