//
//  LoginViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let router: Router
    @Published var isLogin: Bool
    
    init(router: Router, isLogin: Bool) {
        self.router = router
        self.isLogin = isLogin
    }
    
    func showHome() {
        router.showTabBar()
    }
    
    func showSign() {
        isLogin.toggle()
    }
}
