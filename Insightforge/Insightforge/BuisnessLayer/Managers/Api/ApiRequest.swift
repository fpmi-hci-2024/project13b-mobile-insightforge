//
//  ApiRequests.swift
//  Insightforge
//
//  Created by Алексей Зубель on 19.12.24.
//

import Foundation
import Alamofire

enum SemensApi {
    case register(userName: String, password: String, email: String)
    case login(userName: String, password: String)
}
    
extension SemensApi: ApiProtocol {
    struct ApiConstants {
        static let registerPath = "/api/v1/registration"
        static let loginPath = "/api/v1/login"
    }
    
    var baseUrl: URL {
        return NetworkConstants.baseUrl
    }
    
    var path: String {
        switch self {
        case .register:
            return ApiConstants.registerPath
        case .login:
            return ApiConstants.loginPath
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        }
    }
    
    var params: [String : Any] {
        switch self {
        case .register(let userName, let password, let email):
            return [
                "username": userName,
                "password": password,
                "email": email,
            ]
        case .login(let userName, let password):
            return [
                "username": userName,
                "password": password
            ]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .register(_, _, _):
            return [
                "": ""
            ]
        case .login(_, _):
            return [
                "": ""
//                NetworkHeaders.xUserId: userId
            ]
        }
    }
}
