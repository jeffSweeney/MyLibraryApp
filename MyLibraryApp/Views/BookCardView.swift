//
//  BookCardView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct BookCardView: View {
    var book: Book
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)

            VStack (alignment: .leading, spacing: 5) {
                // MARK: Title and Favorite Star
                HStack {
                    Text(book.title)
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    if book.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }

                // MARK: Author
                Text(book.author)
                    .italic()
                

                // MARK: Book Image
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
        .accentColor(.black)
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        BookCardView(book: model.myBooks[0])
    }
}
