//
//  TabBarViewModel.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import Foundation

class TabBarViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func showHome() {
        router.showHome()
    }
}
