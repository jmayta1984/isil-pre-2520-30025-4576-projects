//
//  ProductListViewModel.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import Combine
import Foundation

class ProductListViewModel: ObservableObject {
    @Published var uiState = UiState()
    let repository: ProductRepository = ProductRepositoryImpl.shared
    
    func getAllProducts(){
        uiState = uiState.copy(status: .loading)
        
        repository.getAllProducts { result in
            switch result {
            case .success(let products):
                self.uiState = self.uiState.copy(status: .success, products: products)
            case .failure(let error):
                self.uiState = self.uiState.copy(status: .failure, message: error.localizedDescription)
            }
        }
        
    }
    
    func toggleFavorite(product: Product)  {
        repository.toggleFavorite(product: product)
        
        
        let products = uiState.products.map { item in
            item.id == product.id ? product.copy(isFavorite: !item.isFavorite) : item
        }
        uiState = uiState.copy(products: products)
    }
}
