//
//  GalleryItemList.swift
//  SwiftUIGallery
//
//  Created by mike on 10/22/20.
//

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


