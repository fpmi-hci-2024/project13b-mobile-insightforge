//
//  AddToCartRResponse.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import Foundation

struct AddToCartResponse: Codable {
    let timestamp: String
    let status: Int
    let error: String
    let path: String
}
