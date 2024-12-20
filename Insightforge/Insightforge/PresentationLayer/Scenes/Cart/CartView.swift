//
//  CartView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 20.12.24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(viewModel.books) { book in
                    BookView(book: book)
                }
                .padding(.vertical)
            }
        }
        .background() {
            Color(.C_48_A_4_B)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartAssembly().build()
    }
}
