//
//  BookView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct BookView: View {
    let book: Book
    
    var body: some View {
        Text("IMPLEMENT - BookView - Book is \(book.title)")
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        BookView(book: model.myBooks[0])
    }
}
