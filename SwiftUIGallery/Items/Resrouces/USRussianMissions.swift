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

import Foundation

struct Flight: Identifiable {
    let id = UUID()
    let title: String
    let children: [Flight]?
}

extension Flight {
    
    static var flights: [Flight] {
        [
            Flight(title: "Mercury", children: [
                Flight(title: "Unmanned", children: [
                    Flight(title: "MA-1", children: nil),
                    Flight(title: "MR-1", children: nil),
                    Flight(title: "MR-1A", children: nil),
                    Flight(title: "MR-2", children: nil),
                    Flight(title: "MA-2", children: nil),
                    Flight(title: "MR-BD", children: nil),
                    Flight(title: "MA-3", children: nil),
                    Flight(title: "MA-4", children: nil),
                    Flight(title: "MA-5", children: nil),
                ]),
                Flight(title: "Manned", children: [
                    Flight(title: "MR-3", children: nil),
                    Flight(title: "MR-4", children: nil),
                    Flight(title: "MA-6", children: nil),
                    Flight(title: "MA-7", children: nil),
                    Flight(title: "MA-8", children: nil),
                    Flight(title: "MA-9", children: nil),
                ])
            ]),
            Flight(title: "Gemini", children: [
                Flight(title: "Unanned", children: [
                    Flight(title: "Gemini 1", children: nil),
                    Flight(title: "Gemini 2", children: nil),
                ]),
                Flight(title: "Manned", children: [
                    Flight(title: "Gemini 3", children: nil),
                    Flight(title: "Gemini 4", children: nil),
                    Flight(title: "Gemini 5", children: nil),
                    Flight(title: "Gemini 6", children: nil),
                    Flight(title: "Gemini 7", children: nil),
                    Flight(title: "Gemini 8", children: nil),
                    Flight(title: "Gemini 9", children: nil),
                    Flight(title: "Gemini 10", children: nil),
                ]),
            ]),
            Flight(title: "Apollo", children: [
                Flight(title: "Unanned", children: [
                    Flight(title: "Apollo 4", children: nil),
                    Flight(title: "Apollo 5", children: nil),
                    Flight(title: "Apollo 6", children: nil),
                ]),
                Flight(title: "Manned", children: [
                    Flight(title: "Apollo 7", children: nil),
                    Flight(title: "Apollo 8", children: nil),
                    Flight(title: "Apollo 9", children: nil),
                    Flight(title: "Apollo 10", children: nil),
                    Flight(title: "Apollo 11", children: nil),
                    Flight(title: "Apollo 12", children: nil),
                    Flight(title: "Apollo 13", children: nil),
                    Flight(title: "Apollo 14", children: nil),
                    Flight(title: "Apollo 15", children: nil),
                    Flight(title: "Apollo 16", children: nil),
                    Flight(title: "Apollo 17", children: nil),
                    Flight(title: "Apollo 18", children: nil),
                ]),
            ]),
        ]
    }
}
