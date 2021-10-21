//
//  DecodingService.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import Foundation

class DecodingService {
    
    static func decodeBooks() -> [Book] {
        var result = [Book]()
        
        // MARK: Get Path String
        // Get the path string to the data
        if let pathString = Bundle.main.path(forResource: "Books", ofType: "json") {
            // MARK: Get URL
            // Get the URL from the path string
            let url = URL(fileURLWithPath: pathString)
            
            // MARK: Get Data Object
            // Get the data object
            do {
                let data = try Data(contentsOf: url)
                
                // MARK: Decode Data
                // Decode the data
                do {
                    let decoder = JSONDecoder()
                    result = try decoder.decode([Book].self, from: data)
                } catch {
                    // Could not decode the data
                    print(error)
                }
            } catch {
                // Could not get the data object from the url
                print(error)
            }
        }
        
        // MARK: Return Statement
        return result
    }
}
