//
//  TabBarAssembly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import Foundation

final class TabBarAssembly {
    func build() -> TabBar {
        let router = Router.shared
        let viewModel = TabBarViewModel(router: router)
        return TabBar(viewModel: viewModel)
    }
}
