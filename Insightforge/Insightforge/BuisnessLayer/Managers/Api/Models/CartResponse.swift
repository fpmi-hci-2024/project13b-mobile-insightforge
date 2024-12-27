//
//  CartResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

struct CartResponse: Codable, Identifiable, Hashable {
    let id: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable, Identifiable, Hashable {
    let id: Int
    let book: Book
    let quantity: Int
}

// MARK: - Book
struct Book: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let author: String
    let description: String
    let genres: [String]
    let poster: String
    let price: Int
    let count: Int
}
