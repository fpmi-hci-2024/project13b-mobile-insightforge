//
//  BooksByPageResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

struct BooksByPageResponse: Codable {
    let number: Int
    let size: Int
    let totalPages: Int
    let totalElements: Int
    let first: Bool
    let last: Bool
    let next: Bool
    let previous: Bool
    let elements: [Book]

    struct Book: Codable, Identifiable, Hashable {
        let id: Int
        let title: String
        let author: String
        let description: String?
        let genres: [String]
        let poster: String
        let price: Int
    }
}


