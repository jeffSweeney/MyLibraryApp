//
//  Book.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import Foundation

class Book: Identifiable, Decodable {
    var id: Int
    var title: String
    var author: String
    var isFavorite: Bool
    var currentPage: Int
    var rating: Int
    var content: [String]
}
