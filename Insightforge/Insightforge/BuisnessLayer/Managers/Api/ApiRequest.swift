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
    case getBooksByPage(page: Int, size: Int)
    case getBook(book: Int)
    case addToCart(book: Int, quantity: Int)
    case getCart
}
    
extension SemensApi: ApiProtocol {
    struct ApiConstants {
        static let registerPath = "/api/v1/registration"
        static let loginPath = "/api/v1/login"
        static let booksByPagePath = "/api/v1/books/by-page"
        static let book = "/api/v1/books"
        static let addToCart = "/api/v1/books/cart/add"
        static let getCart = "/api/v1/books/orders"
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
        case .getBooksByPage:
            return ApiConstants.booksByPagePath
        case .getBook(let book):
            return ApiConstants.book + "/\(book)"
        case .addToCart:
            return ApiConstants.addToCart
        case .getCart:
            return ApiConstants.getCart
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        case .getBooksByPage:
            return .get
        case .getBook:
            return .get
        case .addToCart:
            return .get
        case .getCart:
            return .get
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
        case .getBooksByPage(let page, let size):
            return [
                "page": page,
                "size": size
            ]
        case .getBook(let book):
            return [
                "": "",
            ]
        case .addToCart(let book, _):
            return [
                "bookId": book,
                "quantity": 1
            ]
        case .getCart:
            return [
                "": ""
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
        case .getBooksByPage(_, _):
            return [
                "Authorization": "\(getAccessToken() ?? "no token")"
//                NetworkHeaders.xUserId: userId
            ]
        case .getBook(_):
            return [
                "Authorization": "\(getAccessToken() ?? "no token")"
            ]
        case .addToCart(_, _):
            return [
                "Authorization": "\(getAccessToken() ?? "no token")"
            ]
        case .getCart:
            return [
                "Authorization": "\(getAccessToken() ?? "no token")"
            ]
        }
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }
}
