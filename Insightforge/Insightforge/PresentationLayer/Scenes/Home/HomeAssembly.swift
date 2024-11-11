//
//  HomeAssembly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

final class HomeAssembly {
    func build() -> HomeView {
        let router = Router.shared
        let viewModel = HomeViewModel(router: router)
        return HomeView(viewModel: viewModel)
    }
}
