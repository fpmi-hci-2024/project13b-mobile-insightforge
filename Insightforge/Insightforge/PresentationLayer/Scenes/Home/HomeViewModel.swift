//
//  HomeViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let router: Router
    private var httpClient: HTTPClient = BaseHttpClient()
    
    @Published var isLoading: Bool = true
    @Published var books: [BooksByPageResponse.Book] = []
    @Published var booksByPageResponse: BooksByPageResponse?
    @Published var errorMessage: String? = nil
    
    init(router: Router) {
        self.router = router
    }
    
    func getBooksByPage(page: Int, size: Int, completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.getBooksByPage(page: page, size: size).request, decoder: JSONDecoder()) { (result: Result<BooksByPageResponse, ErrorModel>) in
            switch result {
            case .success(let response):
                self.booksByPageResponse = response
                self.books = self.booksByPageResponse?.elements ?? []
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
    
    func showBookDescription(book: Int) {
        print("home screen")
        router.showBookDescription(book: book)
    }
}
