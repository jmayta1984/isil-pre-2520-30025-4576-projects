//
//  ProductDetailViewModel.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published private(set) var quantity = 1
    
    func decreaseQuantity() {
        guard quantity > 1 else { return }
        quantity -= 1
    }
    
    func increaseQuantity() {
        quantity += 1
    }
    
}
