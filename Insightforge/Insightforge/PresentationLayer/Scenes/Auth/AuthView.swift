//
//  AuthView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var membersCount: Int = 100000
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Image(.launchAppIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            VStack(alignment: .center, spacing: 24) {
                Text("Welcome to our world of books! Here, you’ll find the best selections, from classics to the latest releases! Sign up and discover endless literary adventures with personalized recommendations and exclusive discounts for our members.")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .lineLimit(6)
                
                Image(.users)
                    .resizable()
                    .scaledToFit()
                
                HStack(spacing: .zero) {
                    Text("There are already ")
                        .font(.callout)
                    
                    Text("\(membersCount)")
                        .font(.callout)
                        .foregroundStyle(._108606)
                    
                    Text(" of us!")
                        .font(.callout)
                }
            }
            .padding(.horizontal, 10)
            
            
            
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
        .padding(.horizontal, 24)
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
