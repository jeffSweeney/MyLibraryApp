//
//  MyLibraryView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct MyLibraryView: View {
    @EnvironmentObject var bookModel: BookModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (spacing: 30) {
                    ForEach(bookModel.myBooks) { book in
                        NavigationLink(destination: {BookView(book: book)}) {
                            BookCardView(book: book)
                        }
                    }
                }
                .padding(.horizontal, 10)
                
            }.navigationTitle(Text("My Library"))
        }
        // This resolves a bug where the ReadingView would kickback to the
        // BookView as you're swiping pages.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MyLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryView()
            .environmentObject(BookModel.instance)
    }
}
