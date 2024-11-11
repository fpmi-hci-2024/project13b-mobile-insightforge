//
//  LoginView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Login")
            
            Button(action: viewModel.showHome)
            {
                Text("Home")
            }
            
            Button(action: viewModel.showSign)
            {
                Text("Sign")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAssembly().build(isLogin: true)
    }
}
