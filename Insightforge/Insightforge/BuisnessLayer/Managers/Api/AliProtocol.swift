//
//  AliProtocol.swift
//  Insightforge
//
//  Created by Алексей Зубель on 19.12.24.
//

import Foundation
import Alamofire

protocol ApiProtocol {
    var baseUrl: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any] { get }
    var headers: [String: String] { get }
    var request: URLRequest { get }
}

extension ApiProtocol {
    
    var url: URL {
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false)!
        components.path += path
        
        return components.url!
    }
    
    var request: URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 60
        
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        if method == .get {
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
               !params.isEmpty {
                urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                request.url = urlComponents.url
            }
        } else {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                let bodyString = String(data: request.httpBody!, encoding: .utf8)
                print("HTTP Body: \(bodyString)")
            } catch let error {
                print("Error: Can't create json request. Details: \(error)")
            }
        }
        
        if path == "/api/v1/books/cart/add" {
            request.httpMethod = HTTPMethod.post.rawValue
        }
        
        print(request.url)
        print(request.httpMethod)
        
        return request
    }
}
