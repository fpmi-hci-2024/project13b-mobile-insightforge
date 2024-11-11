//
//  AuthViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

class AuthViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func showLogin(isLogin: Bool) {
        router.showAuthLog(isLogin: isLogin)
    }
}
