//
//  HomeView.swift
//  Insightforge
//
//  Created by Алексей Зубель on 11.11.24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    @FocusState var isSearchRequestActive: Bool

    @State var searchRequest: String = ""

    let categories = ["Novel", "Self-love", "Science", "Romance"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "menucard")
                            .font(.title)
                            .frame(width: 36, height: 36)
                            .foregroundStyle(Color.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Hello, User 👋")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("What do you want to read today?")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Image(systemName: "bell.fill")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                // Search Bar
                HStack {
                    Button {
                        if !searchRequest.isEmpty {
                            viewModel.isLoading = true
                            viewModel.searchBookByName(searchRequest, completion: {})
                        }
                    } label: {
                        Image(.searchIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    ZStack {
                        Text("Search by book title here")
                            .font(.callout)
                            .foregroundStyle(.black)
                            .opacity(searchRequest.isEmpty && !isSearchRequestActive ? 0.6 : 0)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                        
                        TextField(searchRequest, text: $searchRequest)
                            .font(.callout)
                            .foregroundStyle(.black)
                            .colorMultiply(.white)
                            .frame(alignment: .leading)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 16)
                            .focused($isSearchRequestActive)
                    }
                    .frame(height: 52)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.FFE_9_D_2)
                    )
                    
                    Image(systemName: "slider.horizontal.3")
                        .font(.title3)
                        .padding(.leading, 8)
                }
                .padding(.horizontal)
                
                // Categories
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 5)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(category == "Novel" ? .black : .clear),
                                        alignment: .bottom
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Book List
                    ScrollView(.vertical, showsIndicators: false) {
                        if !viewModel.isLoading {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 14), count: 2), spacing: 14) {
                                ForEach(viewModel.books) { book in
                                    BookView(book: book)
                                        .onTapGesture {
                                            viewModel.showBookDescription(book: book.id)
                                        }
                                }
                            }
                            .padding(.vertical)
                        } else {
                            if viewModel.errorMessage != nil {
                                Text("What do you want to read today?")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                    Text("New Arrivals")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // New Arrivals Placeholder
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
//                            BookView(book: viewModel.books[0])
//                            BookView(book: viewModel.books[1])
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background() {
                Color(.C_48_A_4_B)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
            }
            .navigationBarHidden(true)
        }
        .background() {
            Color(.C_48_A_4_B)
                .opacity(0.3)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
        .onChange(of: searchRequest, perform: { value in
            if value.isEmpty {
                print("""

    onChangeSearchRequest!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    """)
                viewModel.getBooksByPage(page: 0,
                                         size: 20,
                                         completion: {
                                            if viewModel.errorMessage == nil {
                                                
                                            }
                                        })
            }
        })
        .onAppear() {
            viewModel.getBooksByPage(page: 0,
                                     size: 20,
                                     completion: {
                                        if viewModel.errorMessage == nil {
                                            
                                        }
                                    })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAssembly().build()
    }
}
