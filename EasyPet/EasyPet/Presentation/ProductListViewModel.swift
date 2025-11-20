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
        uiState = UiState(status: .loading, products: uiState.products, message: uiState.message)
        
        repository.getAllProducts { result in
            switch result {
            case .success(let products):
                self.uiState = UiState(status: .success, products: products, message: nil)
            case .failure(let error):
                self.uiState = UiState(status: .failure, products: [], message: error.localizedDescription)
            }
        }
        
    }
}
