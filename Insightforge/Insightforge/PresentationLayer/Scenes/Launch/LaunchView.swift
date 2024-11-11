//
//  LaunchView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct LaunchView: View {
    @ObservedObject var viewModel: LaunchViewModel

    var body: some View {
        Text("Launch")
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
