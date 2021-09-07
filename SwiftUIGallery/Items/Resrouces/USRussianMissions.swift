//
//  USRussianMissions.swift
//  SwiftUIGallery
//
//  Created by mike on 9/1/21.
//

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
