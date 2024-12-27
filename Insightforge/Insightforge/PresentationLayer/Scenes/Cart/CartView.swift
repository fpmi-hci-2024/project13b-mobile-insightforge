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
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "menucard")
                        .font(.title)
                        .frame(width: 36, height: 36)
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
                
                Image(systemName: "bell.fill")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                if let response = viewModel.cartResponse {
                    ForEach(response.items) { book in
                        ZStack(alignment: .center) {
                            if viewModel.isLoading {
                                ProgressView()
                                    .frame(width: 200, height: 200)
                            }

                            HStack {
                                BookView(book: BooksByPageResponse.Book(
                                    id: book.book.id,
                                    title: book.book.title,
                                    author: book.book.author,
                                    description: nil,
                                    genres: [],
                                    poster: book.book.poster,
                                    price: book.book.price))
                                
                                Spacer()
                                
                                HStack(spacing: 8) {
                                    Button(action: {
                                        viewModel.isLoading = true
                                        viewModel.removeBookFromCart(id: book.book.id, completion: {
                                            viewModel.getCart{
                                                
                                            }
                                        })
                                        
                                    }) {
                                        Image(systemName: "minus")
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(._3_D_2000)
                                            .padding(8)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    }
                                    
                                    Text("\(book.quantity)")
                                        .font(.headline)
                                    
                                    Button(action: {
                                        viewModel.isLoading = true
                                        viewModel.addToCart(book: book.book.id, completion: {
                                            viewModel.getCart{
                                                
                                            }
                                        })
                                    }) {
                                        Image(systemName: "plus")
                                            .frame(width: 16, height: 16)
                                            .foregroundStyle(._3_D_2000)
                                            .padding(8)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    }
                                }
                            }
                            .background() {
                                Color.white.opacity(0.3).ignoresSafeArea()
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Total")
                        .font(.headline)
                    if let response = viewModel.cartResponse {
                        Text("\(response.items.count)")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                Spacer()
                Button(action: {
                    print("Pay Now tapped!")
                }) {
                    Text("Pay Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color._3_D_2000)
                        .cornerRadius(12)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .padding(.bottom, 12)
        }
        .background() {
            Color(.C_48_A_4_B)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
        .navigationBarHidden(true)
        .onAppear() {
            viewModel.getCart {
                
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartAssembly().build()
    }
}
