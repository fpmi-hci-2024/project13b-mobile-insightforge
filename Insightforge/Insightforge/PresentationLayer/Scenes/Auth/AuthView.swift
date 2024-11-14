//
//  AuthView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Auth")
            
            Button(action: {
                viewModel.showLogin(isLogin: true)
            })
            {
                Text("Login")
            }
            
            Button(action: {
                viewModel.showLogin(isLogin: false)
            })
            {
                Text("Sign")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background() {
            Color(.EBF_2_EB)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthAssembly().build()
    }
}
