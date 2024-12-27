//
//  CartViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 20.12.24.
//

import Foundation

class CartViewModel: ObservableObject {
    private let router: Router
    private var httpClient: HTTPClient = BaseHttpClient()
    
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    @Published var cartResponse: CartResponse?
    
    @Published var books: [BooksByPageResponse.Book] = [
//        Book(title: "Catcher in the Rye", author: "J.D. Salinger", price: "$4.99", imageName: .default),
//        Book(title: "Someone Like You", author: "Roald Dahl", price: "$4.99", imageName: .default),
//        Book(title: "Lord of the Rings", author: "J.R.R. Tolkien", price: "$4.99", imageName: .default)
    ]
    
    init(router: Router) {
        self.router = router
    }
    
    func getCart(completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.getCart.request, decoder: JSONDecoder()) { (result: Result<CartResponse, ErrorModel>) in
            switch result {
            case .success(let response):
                self.isLoading = false
                self.cartResponse = response
                completion()
            case .failure(let failure):
                self.errorMessage = "Error: Can't get cart from server. Details: \(failure)"
                self.isLoading = false
                print("Error: Can't get cart from server. Details: \(failure)")
                completion()
            }
        }
    }
}
