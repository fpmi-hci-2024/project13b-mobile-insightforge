//
//  LaunchAssembly.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

final class LaunchAssembly {
    func build() -> LaunchView {
        let router = Router.shared
        let viewModel = LaunchViewModel(router: router)
        return LaunchView(viewModel: viewModel)
    }
}
