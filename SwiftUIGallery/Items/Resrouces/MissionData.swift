//MissionoData: Reads in the Spacemissions.json

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

struct ApolloPatches{
	
    let apolloPatches = ["Apollo 1","Apollo 7",
                         "Apollo 8","Apollo 9",
                         "Apollo 10","Apollo 11",
                         "Apollo 12","Apollo 13",
                         "Apollo 14","Apollo 15",
                         "Apollo 16","Apollo 17",
                         "Apollo 18"]
	
	init(){
		
	}
}

struct GeminiPatches{
    
    let geminiPatches = ["Gemini 3","Gemini 4",
                         "Gemini 5","Gemini 6",
                         "Gemini 7","Gemini 8",
                         "Gemini 9","Gemini 10",
                         "Gemini 11","Gemini 12"]
    
    init(){
        
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let missions = try Missions(json)

import Foundation

// MARK: - Mission
struct Mission: Codable{
    var id = UUID()             //needed to make this work in a ForEach.
    let name, patch, missionDescription, date: String
    let crew, codeNames, crewpict: String
    let bestpict, bestpictcaption: String

    enum CodingKeys: String, CodingKey {
        case name, patch
        case missionDescription = "description"
        case date, crew
        case codeNames = "code names"
        case crewpict
        case bestpict
        case bestpictcaption
    }
}

// MARK: Mission convenience initializers and mutators

extension Mission {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Mission.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        patch: String? = nil,
        missionDescription: String? = nil,
        date: String? = nil,
        crew: String? = nil,
        codeNames: String? = nil,
        crewpict: String? = nil,
        bestpict: String? = nil,
        bestpictcaption: String? = nil
    ) -> Mission {
        return Mission(
            name: name ?? self.name,
            patch: patch ?? self.patch,
            missionDescription: missionDescription ?? self.missionDescription,
            date: date ?? self.date,
            crew: crew ?? self.crew,
            codeNames: codeNames ?? self.codeNames,
            crewpict: crewpict ?? self.crewpict,
            bestpict: bestpict ?? self.bestpict,
            bestpictcaption: bestpictcaption ?? self.bestpictcaption
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

typealias Missions = [Mission]

extension Array where Element == Missions.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Missions.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

struct AllMissions
{
    var missions : Missions?
    
    init(){
        do {
            let path = Bundle.main.path(forResource: "Spacemissions.json", ofType:nil)
            
            if  (path != nil){
                print("Got file: \(String(describing: path))")
            }
            
            let result = try String(contentsOfFile: path!, encoding: .utf8)
            
            missions=try Missions(result)
            
        }catch let error {
            Swift.print ("Other cases: Error: \(error.localizedDescription)") // I like all other colors
        }
    }
}

