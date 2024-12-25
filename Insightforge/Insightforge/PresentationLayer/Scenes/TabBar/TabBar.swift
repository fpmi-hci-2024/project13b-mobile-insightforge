//
//  TabBar.swift
//  Insightforge
//
//  Created by Алексей Зубель on 13.12.24.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeAssembly().build()
            }
            .tabItem {
                Image(.tabBarHome)
            }
            
            Text("Library")
                .tabItem {
                    Image(.tabBarLib)
                }
            
            NavigationStack {
                CartAssembly().build()
            }
            .tabItem {
                Image(.tabBarCart)
            }
            
            Text("Marked")
                .tabItem {
                    Image(.tabBarMarked)
                }
            
            Text("Settings")
                .tabItem {
                    Image(.tabBarSettings)
                }
        }
        .frame(maxHeight: .infinity)
        .navigationBarHidden(true)
        .background() {
            Color(.C_48_A_4_B)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarAssembly().build()
    }
}
