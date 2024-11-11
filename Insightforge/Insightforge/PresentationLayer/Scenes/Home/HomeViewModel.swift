//
//  HomeViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
}
