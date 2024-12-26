//
//  BookDescriptionViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

class BookDescriptionViewModel: ObservableObject {
    private let router: Router
    private var httpClient: HTTPClient = BaseHttpClient()
    
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    @Published var bookResponse: BooksByPageResponse.Book?

    private var book: Int
    
    init(router: Router, book: Int) {
        self.router = router
        self.book = book
        self.getBooksByPage(book: book, completion: {})
    }
    
    func getBooksByPage(book: Int, completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.getBook(book: book).request, decoder: JSONDecoder()) { (result: Result<BooksByPageResponse.Book, ErrorModel>) in
            switch result {
            case .success(let response):
                self.bookResponse = response
                self.isLoading = false
                completion()
            case .failure(let failure):
                self.errorMessage = "Error: Can't get books from server. Details: \(failure)"
                self.isLoading = false
                print("Error: Can't get books from server. Details: \(failure)")
                completion()
            }
        }
    }
    
    func addToCart(completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.addToCart(book: book, quantity: 1).request, decoder: JSONDecoder()) { (result: Result<AddToCartResponse, ErrorModel>) in
            switch result {
            case .success(let response):
                self.isLoading = false
                completion()
            case .failure(let failure):
                self.errorMessage = "Error: Can't get books from server. Details: \(failure)"
                self.isLoading = false
                print("Error: Can't get books from server. Details: \(failure)")
                completion()
            }
        }
    }
}
