//
//  CartAssemly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 20.12.24.
//

import Foundation

final class CartAssembly {
    func build() -> CartView {
        let router = Router.shared
        let viewModel = CartViewModel(router: router)
        return CartView(viewModel: viewModel)
    }
}
