//
//  CartViewModel.swift
//  EasyShop
//
//  Created by Jorge Mayta on 1/10/25.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var cartItems: [CartItem] = []
    
    func addCartItem(product: Product, quantity: Int) {
        cartItems.append(CartItem(product: product, quantity: quantity))
    }
}
