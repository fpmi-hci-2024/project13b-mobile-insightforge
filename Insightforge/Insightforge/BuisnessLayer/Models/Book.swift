//
//  Book.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let price: String
    let imageName: ImageResource
}
