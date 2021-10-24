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
    
    private func findIndex(_ forId: Int) -> Int? {
        return myBooks.firstIndex(where: {$0.id == forId})
    }
    
    func flipFavorite(forId: Int) {
        if let atIndex = findIndex(forId) {
            myBooks[atIndex].isFavorite.toggle()
        }
    }
    
    func updateRating(forId: Int, newRating: Int) {
        if let atIndex = findIndex(forId) {
            myBooks[atIndex].rating = newRating
        }
    }
    
    func updateCurrentPageIndex(forId: Int, newIndex: Int) {
        if let atIndex = findIndex(forId) {
            myBooks[atIndex].currentPage = newIndex
        }
    }
}
