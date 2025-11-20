//
//  ProductListView.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    var body: some View {
        
        VStack {
            switch viewModel.uiState.status {
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach (viewModel.uiState.products) { product in
                                ProductCard(product: product)
                            }
                        }
                }
                
            case .failure:
                Text(viewModel.uiState.message ?? "Unknown Error")
            }
        }
        .onAppear {
            viewModel.getAllProducts()
        }
        
        
    }
}

#Preview {
    ProductListView()
}
