//
//  BookDescriptionView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 26.12.24.
//

import SwiftUI

struct BookDescriptionView: View {
    @ObservedObject var viewModel: BookDescriptionViewModel

    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            AsyncImage(url: URL(string: viewModel.bookResponse?.poster ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 300, alignment: .center)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 300)
                case .failure:
                    ProgressView()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 300, alignment: .center)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .center, spacing: .zero) {
                Text(viewModel.bookResponse?.title ?? "")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                Text(viewModel.bookResponse?.author ?? "")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                
                Text("\(viewModel.bookResponse?.price ?? 0)")
                    .font(.callout)
                    .multilineTextAlignment(.center)
            }
                    
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("About the author")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                
                Text("\(viewModel.bookResponse?.author ?? "") был американским писателем, наиболее известным своим 1951 романом The Catcher in the Rye. Перед публикацией Салингер опубликовал несколько коротких рассказов в журнале Story")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .padding(.bottom, 10)
                
                Text("Overview")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                
                Text("\(viewModel.bookResponse?.description ?? "")")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
            }
            
            Spacer()
                        
            Button(action: {
                viewModel.addToCart(completion: {})
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color._3_D_2000)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
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

//struct BookDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDescriptionAssemly().build()
//    }
//}
