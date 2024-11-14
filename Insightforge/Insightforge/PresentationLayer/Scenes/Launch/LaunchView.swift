//
//  LaunchView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI
import Lottie

struct LaunchView: View {
    @ObservedObject var viewModel: LaunchViewModel

    var body: some View {
        ZStack (alignment: .center) {
            Image(.launchAppIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            VStack {
                Spacer()
                
                LottieView(animation: .named("LaunchLoading"))
                    .playing(loopMode: .loop)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 80)
            }        
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background() {
            Color(.EBF_2_EB)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                viewModel.showAuth()
            })
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAssembly().build()
    }
}
