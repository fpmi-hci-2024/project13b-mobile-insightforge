//
//  Router.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import Foundation

final class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = [Route]()
//    {
//        didSet {
//            print("Current path: \(path)")
//        }
//    }
    
    
    func showAuth() {
        path.append(.auth)
    }
    
    func showAuthLog(isLogin: Bool) {
        path.append(.authLog(isLogin))
    }
    
    func showBookDescription(book: Int) {
        print("Router")
        path.append(.bookDescription(book))
    }
    
    func showTabBar() {
        path.append(.tabBar)
    }
    
    func showHome() {
        path.append(.home)
    }
    
    func backToRoot() {
        path.removeAll()
    }
    
    func back() {
        path.removeLast()
    }
}
