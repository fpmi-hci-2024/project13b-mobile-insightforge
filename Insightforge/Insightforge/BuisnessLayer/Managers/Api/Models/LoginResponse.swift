//
//  RegisterResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 19.12.24.
//

import Foundation

struct LoginResponse: Codable {
    let code: String
    let detail: String
    let access_token: String
    let refresh_token: String

}
