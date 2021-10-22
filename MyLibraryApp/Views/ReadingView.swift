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
        TabView {
            ForEach(0 ..< book.content.count, id: \.self) { contentIndex in
                VStack {
                    Text(book.content[contentIndex])
                    Spacer()
                    Text(String(contentIndex+1))
                }
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .navigationBarTitle(book.title)
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        ReadingView(book: model.myBooks[0])
    }
}
