//
//  ViewModel.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import Foundation

class BookModel: ObservableObject {
    @Published var myBooks: [Book]
    
    // Singleton instance of this ViewModel
    static let instance = BookModel()
    
    private init() {
        myBooks = DecodingService.decodeBooks()
    }
}
