//
//  BookDescriptionAssemly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

final class BookDescriptionAssemly {
    func build(book: Int) -> BookDescriptionView {
        let router = Router.shared
        let viewModel = BookDescriptionViewModel(router: router, book: book)
        return BookDescriptionView(viewModel: viewModel)
    }
}
