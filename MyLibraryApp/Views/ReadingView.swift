//
//  ReadingView.swift
//  MyLibraryApp
//
//  Created by Jeffrey Sweeney on 10/21/21.
//

import SwiftUI

struct ReadingView: View {
    var book: Book
    
    @EnvironmentObject var model: BookModel
    @State var onPageIndex = 0
    
    var body: some View {
        TabView (selection: $onPageIndex) {
            ForEach(0 ..< book.content.count, id: \.self) { contentIndex in
                VStack {
                    Text(book.content[contentIndex])
                    Spacer()
                    Text(String(contentIndex+1))
                }
                .padding()
                .tag(contentIndex)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .navigationBarTitle(book.title)
        .onChange(of: onPageIndex) { updatedIndex in
            model.updateCurrentPageIndex(forId: book.id, newIndex: updatedIndex)
        }
        .onAppear {
            // On appear was executing a little too quickly. This will
            // delay it just long enough to properly evaluate.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                onPageIndex = book.currentPage
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel.instance
        ReadingView(book: model.myBooks[0])
            .environmentObject(model)
    }
}
