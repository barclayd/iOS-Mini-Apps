//
//  BookDetailView.swift
//  Bookshelf
//
//  Created by Daniel Barclay on 03/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import CoreData
import SwiftUI

struct BookDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showDeleteAlert = false

    let book: Book

    func deleteBook() {
        moc.delete(book)

        try? moc.save()
        presentationMode.wrappedValue.dismiss()
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)

                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(self.book.review ?? "No review")
                    .padding()
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Book"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
        .alert(isPresented: $showDeleteAlert) {
            Alert(title: Text("Delete \(book.title ?? "book")"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                self.deleteBook()
            }, secondaryButton: .cancel())
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "What a great novel!"

        return NavigationView {
            BookDetailView(book: book)
        }
    }
}
