//
//  ViewModel.swift
//  DisplayJsonList
//
//  Created by Leone on 2/26/23.
//

import Foundation

class JsonViewModel: ObservableObject {
    
    // Load the shoppingCart model
    @Published var shoppingCart: ShoppingCart = load("sampleJson.json")
    
}

/// Loads JSON data from a file in the project, then decodes it into the type of class hinted
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
