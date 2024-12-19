//
//  SnakeDecoder.swift
//  CoinID
//
//  Created by Алексей Зубель on 17.12.24.
//

import Foundation

class SnakeDecoder: JSONDecoder {
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
