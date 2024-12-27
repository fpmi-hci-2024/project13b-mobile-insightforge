//
//  BookView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import SwiftUI

struct BookView: View {
    let book: BooksByPageResponse.Book
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: book.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 150, alignment: .center)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 150)
                case .failure:
                    ProgressView()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 150, alignment: .center)
                @unknown default:
                    EmptyView()
                }
            }
            Text(book.title)
                .font(.headline)
                .lineLimit(2)
                .foregroundColor(.black)
            Text(book.author)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("\(book.price)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(width: 120)
    }
}

//#Preview {
//    BookView(book: BooksByPageResponse.Book(title: "Book 1", author: "Author 1", price: "1.32", imageName: .default))
//}
