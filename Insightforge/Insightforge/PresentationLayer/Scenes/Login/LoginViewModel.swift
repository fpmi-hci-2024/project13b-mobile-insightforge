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

    @Published var registerResponse: RegisterResponse?
    @Published var loginResponse: LoginResponse?
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
        httpClient.send(request: SemensApi.register(userName: userName, password: password, email: email).request, decoder: JSONDecoder()) { (result: Result<RegisterResponse, ErrorModel>) in
            switch result {
            case .success(let response):
                self.registerResponse = response
                self.saveAccessToken(response.access_token)
                self.isLoading = false
                completion()
            case .failure(let failure):
                self.errorMessage = "Error: Can't occur registration. Details: \(failure)"
                self.isLoading = false
                print("Error: Can't occur registration. Details: \(failure)")
                completion()
            }
        }
    }
    
    func login(userName: String, password: String, completion: @escaping () -> Void) {
        httpClient.send(request: SemensApi.login(userName: userName, password: password).request, decoder: JSONDecoder()) { (result: Result<LoginResponse, ErrorModel>) in
            switch result {
            case .success(let response):
                self.loginResponse = response
                self.isLoading = false
                print("access token from server \(response.access_token)")
                print("access token from application \(self.getAccessToken() ?? "have no token")")

//                if response.access_token != self.getAccessToken() {
//                    self.errorMessage = "Error: Can't occur registration. Details: user access token and "
//                }
                completion()
            case .failure(let failure):
                self.errorMessage = "Error: Can't occur login."
                self.isLoading = false
                print("Error: Can't occur login. Details: \(failure)")
                completion()
            }
        }
    }
    
    func saveAccessToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "accessToken")
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }
}
