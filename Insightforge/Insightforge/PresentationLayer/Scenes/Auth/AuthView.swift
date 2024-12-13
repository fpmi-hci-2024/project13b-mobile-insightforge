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
        VStack(alignment: .center, spacing: 16) {
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
                        .foregroundStyle(.black)
                    
                    Text(" of us!")
                        .font(.callout)
                }
            }
            .padding(.horizontal, 10)
            
            Spacer()
        
            ContinueActionButton(title: "Create Account", titleColor: .white, action: {
                viewModel.showLogin(isLogin: true)
            })
        
            ContinueActionButton(title: "I already have an account", gradient: Gradient(colors: [.FFE_9_D_2, .FFE_9_D_2]), action: {
                viewModel.showLogin(isLogin: false)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 24)
        .background() {
            Color(.C_48_A_4_B)
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
