//
//  BookListView.swift
//  Bookshelf
//
//  Created by Daniel Barclay on 03/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import SwiftUI

struct BookListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true), NSSortDescriptor(keyPath: \Book.rating, ascending: false)]) var books: FetchedResults<Book>

    @State private var showAddBookScreen = false

    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                Text("Number of Books: \(books.count)")
                    .padding()
                    .navigationBarTitle("Bookshelf")
                    .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                        self.showAddBookScreen.toggle()
                    }) {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $showAddBookScreen) {
                        AddBookView().environment(\.managedObjectContext, self.moc)
                    }
                List {
                    ForEach(books, id: \.self) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title").font(.headline)
                                Text(book.author ?? "Unknown Author").foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deleteBooks)
                }
            }
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
