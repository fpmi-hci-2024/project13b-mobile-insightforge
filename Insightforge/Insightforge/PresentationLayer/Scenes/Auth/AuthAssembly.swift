//
//  AuthAssembly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

final class AuthAssembly {
    func build() -> AuthView {
        let router = Router.shared
        let viewModel = AuthViewModel(router: router)
        return AuthView(viewModel: viewModel)
    }
}
