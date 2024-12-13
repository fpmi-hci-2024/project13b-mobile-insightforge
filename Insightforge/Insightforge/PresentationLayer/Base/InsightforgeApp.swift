//
//  InsightforgeApp.swift
//  Insightforge
//
//  Created by Алексей Зубель on 10.11.24.
//

import SwiftUI

@main
struct InsightforgeApp: App {
    @ObservedObject var router = Router.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                LaunchAssembly().build()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .auth:
                            AuthAssembly().build()
                        case .authLog(let isLogin):
                            LoginAssembly().build(isLogin: isLogin)
                        case .home:
                            HomeAssembly().build()
                        case .tabBar:
                            TabBarAssembly().build()
                        }
                    }
            }
        }
    }
}
