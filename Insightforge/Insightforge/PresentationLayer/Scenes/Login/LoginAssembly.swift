//
//  LoginAssembly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

final class LoginAssembly {
    func build(isLogin: Bool) -> LoginView {
        let router = Router.shared
        let viewModel = LoginViewModel(router: router, isLogin: isLogin)
        return LoginView(viewModel: viewModel)
    }
}
