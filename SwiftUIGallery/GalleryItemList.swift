
//  GalleryItemList.swift

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

let galleryItemfile = "galleryItems.json"

let galleryItemList: [GalleryItem] = load(galleryItemfile)

func load<T :Decodable>(_ filename: String)->T{

	let data: Data
	
	guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
	else {
		fatalError("Unable to find \(filename)")
	}
	
	do{
		data =  try Data(contentsOf: file)
	}catch{
		fatalError("Unable to load \(filename)")
	}
	
	do{
		let decoder = JSONDecoder()
		
		return try decoder.decode(T.self, from: data)
	}
	catch{
		fatalError("couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}


