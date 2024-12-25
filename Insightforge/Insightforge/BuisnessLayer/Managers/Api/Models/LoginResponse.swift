//
//  RegisterResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 19.12.24.
//

import Foundation

struct LoginResponse: Codable {
    let detail: String
    let access_token: String
    let refresh_token: String
}

struct RegisterResponse: Codable {
    let detail: String
    let access_token: String
    let refresh_token: String
}
