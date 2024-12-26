//
//  CartResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

struct CartResponse: Codable {
    let id: Int
    let orderDate: String
    let user: User
    let items: [CartItem]
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username: String
    let password: String
    let roles: [Role]
    let email: String
    let enabled: Bool
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let title: String
}

// MARK: - CartItem
struct CartItem: Codable, Identifiable {
    let id: Int
    let quantity: Int
    let order: String
    let book: Book
}

// MARK: - Book
struct Book: Codable {
    let id: Int
    let title: String
    let description: String
    let poster: String
    let author: Author
    let genres: [Genre]
    let stock: Int
}

// MARK: - Author
struct Author: Codable {
    let id: Int
    let name: String
    let books: [String]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
