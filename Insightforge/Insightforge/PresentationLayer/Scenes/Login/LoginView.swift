//
//  LoginView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    @FocusState var isFocusedUsername: Bool
    @FocusState var isFocusedPassword: Bool
    @FocusState var isFocusedEmail: Bool
    @FocusState var isFocusedPasswordRepeat: Bool
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var repeatPassword: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            Image(.launchAppIcon)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
            
            Spacer()
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .font(.title3)
                    .foregroundStyle(error.contains("succeed") ? .FFE_9_D_2 : .red)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 50)
                
                Spacer()
            }
            
            VStack(spacing: 12) {
                Text(viewModel.isLogin ? "Log in to your account" : "Create your account")
                    .font(.body)
                    .foregroundStyle(.black)
                
                ZStack {
                    Text("Username")
                        .font(.callout)
                        .foregroundStyle(.black)
                        .opacity(username.isEmpty && !isFocusedUsername ? 0.7 : 0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    TextField(username, text: $username)
                        .font(.callout)
                        .foregroundStyle(.black)
                        .colorMultiply(.white)
                        .frame(alignment: .leading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 16)
                        .focused($isFocusedUsername)
                }
                .frame(height: 52)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.FFE_9_D_2)
                )
                
                if !viewModel.isLogin {
                    ZStack {
                        Text("E-mail")
                            .font(.callout)
                            .foregroundStyle(.black)
                            .opacity(email.isEmpty && !isFocusedEmail ? 0.7 : 0)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                        
                        TextField(email, text: $email)
                            .font(.callout)
                            .foregroundStyle(.black)
                            .colorMultiply(.white)
                            .frame(alignment: .leading)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 16)
                            .focused($isFocusedEmail)
                    }
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.FFE_9_D_2)
                    )
                }
                
                ZStack {
                    Text("Password")
                        .font(.callout)
                        .foregroundStyle(.black)
                        .opacity(password.isEmpty && !isFocusedPassword ? 0.7 : 0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    TextField(password, text: $password)
                        .font(.callout)
                        .foregroundStyle(.black)
                        .colorMultiply(.white)
                        .frame(alignment: .leading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 16)
                        .focused($isFocusedPassword)
                }
                .frame(height: 52)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.FFE_9_D_2)
                )
                
                if !viewModel.isLogin {
                    ZStack {
                        Text("Repeat password")
                            .font(.callout)
                            .foregroundStyle(.black)
                            .opacity(repeatPassword.isEmpty && !isFocusedPasswordRepeat ? 0.7 : 0)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                        
                        TextField(repeatPassword, text: $repeatPassword)
                            .font(.callout)
                            .foregroundStyle(.black)
                            .colorMultiply(.white)
                            .frame(alignment: .leading)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 16)
                            .focused($isFocusedPasswordRepeat)
                    }
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.FFE_9_D_2)
                    )
                }
                
                ContinueActionButton(title: viewModel.isLogin ? "Log in" : "Create Account", titleColor: .white, action: {
                    viewModel.register(userName: username, password: password, email: email, completion: {
                        if viewModel.errorMessage == nil || viewModel.errorMessage == "Error: Can't occur registration. Details: Registration succeed" {
                            viewModel.showHome()
                        }
                    })
                })
                .padding(.top, 12)
            }
            
            Spacer()
            
            HStack() {
                Text(viewModel.isLogin ? "Don't have an account yet?" : "Already have an account?")
                
                Button {
                    viewModel.showSign()
                } label: {
                    Text(viewModel.isLogin ? "Sign up here" : "Log in here")
                        .font(.headline)
                        .foregroundStyle(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 24)
        .background() {
            Color(.C_48_A_4_B)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginAssembly().build(isLogin: true)
    }
}
