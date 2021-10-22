//
//  BookView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct BookView: View {
    @EnvironmentObject var model: BookModel
    
    // Default state property. Will read official value onAppear.
    @State var ratingIndex = 2
    
    var book: Book
    
    var body: some View {
        VStack (alignment: .center) {
            NavigationLink(destination: {ReadingView(book: book)}) {
                VStack {
                    Text("Read Now!")
                        .font(.title)
                        .padding(.top, 30)
                        .accentColor(.black)
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
            
            VStack (spacing: 10) {
                Text("Mark for later!")
                    .font(.headline)
                
                Button(action: {
                    model.flipFavorite(forId: book.id)
                }) {
                    let sfSymbol = book.isFavorite ? "star.fill" : "star"
                    Image(systemName: sfSymbol)
                        .resizable()
                        .scaledToFill()
                        .accentColor(.yellow)
                        .frame(width: 20, height: 20)
                }
            }
            
            VStack {
                Text("Rate \(book.title)")
                    .font(.headline)
                
                Picker("Book Rating", selection: $ratingIndex) {
                    ForEach(1...5, id: \.self) { index in
                        Text(String(index)).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
                .onChange(of: ratingIndex) { newRating in
                    model.updateRating(forId: book.id, newRating: newRating)
                }
            }
            .padding(.vertical, 20)
        }
        .navigationTitle(book.title)
        .onAppear(perform: {
            ratingIndex = book.rating
        })
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        BookView(book: model.myBooks[0])
            .environmentObject(model)
    }
}
