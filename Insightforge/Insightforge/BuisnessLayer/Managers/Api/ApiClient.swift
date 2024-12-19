//
//  ApiClient.swift
//  Insightforge
//
//  Created by Алексей Зубель on 19.12.24.
//

import Foundation
import Alamofire

//protocol HTTPClient {
//    func send(request: URLRequest, decoder: JSONDecoder, completion: @escaping (Result<SearchByImageResponse, ErrorModel>) -> Void)
//}
//
//class BaseHttpClient {}
//
//extension BaseHttpClient: HTTPClient {
//    
//    func send(
//        request: URLRequest,
//        decoder: JSONDecoder = SnakeDecoder(),
//        completion: @escaping (Result<SearchByImageResponse, ErrorModel>) -> Void
//    ) {
//        AF.request(request)
//            .response { response in
//                guard let _response = response.response else {
//                    completion(.failure(ErrorModel(message: "Invalid HTTP Response")))
//                    return
//                }
//                guard let data = response.data else {
//                    completion(.failure(ErrorModel(message: "No data received")))
//                    return
//                }
//                switch _response.statusCode {
//                case (200...299):
//                    do {
//                        let decodedData: SearchByImageResponse = try decoder.decode(SearchByImageResponse.self, from: data)
//                        completion(.success(decodedData))
//                    } catch let error {
//                        completion(.failure(ErrorModel(message: "Failed to decode server resonse: \(error)")))
//                    }
//                case (400...499):
//                    do {
//                        let decodedError = try decoder.decode(ErrorModel.self, from: data)
//                        completion(.failure(decodedError))
//                    } catch let error {
//                        completion(.failure(ErrorModel(message: "Failed to decode error: \(error)")))
//                    }
//                case (500...599):
//                    completion(.failure(ErrorModel(message: "Server is down")))
//                default:
//                    completion(.failure(ErrorModel(message: "Request failed")))
//                }
//            }
//    }
//}


