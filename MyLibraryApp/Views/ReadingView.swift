//
//  ReadingView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct ReadingView: View {
    var book: Book
    
    var body: some View {
        Text("IMPLEMENT - ReadingView - \(book.title)")
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        ReadingView(book: model.myBooks[0])
    }
}
