//
//  ErrorModel.swift
//  CoinID
//
//  Created by Алексей Зубель on 17.12.24.
//

import Foundation

struct ErrorModel: Error, Codable {
    let message: String
}
