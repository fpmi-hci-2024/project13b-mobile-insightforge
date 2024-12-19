//
//  BookView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import SwiftUI

struct BookView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(book.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(height: 150)
            Text(book.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.black)
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(book.price)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 120)
    }
}

#Preview {
    BookView(book: Book(title: "Book 1", author: "Author 1", price: "1.32", imageName: .default))
}
