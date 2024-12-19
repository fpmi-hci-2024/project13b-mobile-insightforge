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
    case login(userId: String, images: [String])
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
                "userName": userName,
                "password": password,
                "email": email,
            ]
        case .login(_, let images):
            return [
                "images": images,
                "similar_images": true
            ]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .register(_, _, _):
            return [
                "": ""
            ]
        case .login(let userId, _):
            return [
                NetworkHeaders.xUserId: userId
            ]
        }
    }
}
