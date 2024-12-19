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
    
    var httpClient: HTTPClient = BaseHttpClient()

    @Published var registerResponse: LoginResponse?
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    
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
    
    func register(userName: String, password: String, email: String, completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.register(userName: userName, password: password, email: email).request, decoder: JSONDecoder()) { (result: Result<Int, ErrorModel>) in
            switch result {
            case .success(let code):
                self.isLoading = false
                completion()
            case .failure(let failure):
                self.isLoading = false
                self.errorMessage = "Error: Can't occur registration. Details: \(failure)"
                print("Error: Can't occur registration. Details: \(failure)")
                completion()
            }
        }
    }
}
