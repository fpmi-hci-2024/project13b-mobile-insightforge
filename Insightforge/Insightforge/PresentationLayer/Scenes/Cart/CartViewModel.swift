//
//  CartViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 20.12.24.
//

import Foundation

class CartViewModel: ObservableObject {
    private let router: Router
    
    @Published var books: [Book] = [
        Book(title: "Catcher in the Rye", author: "J.D. Salinger", price: "$4.99", imageName: .default),
        Book(title: "Someone Like You", author: "Roald Dahl", price: "$4.99", imageName: .default),
        Book(title: "Lord of the Rings", author: "J.R.R. Tolkien", price: "$4.99", imageName: .default)
    ]
    
    init(router: Router) {
        self.router = router
    }
}
