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
        if let index = cartItems.firstIndex(where: { $0.product.name == product.name}) {
            cartItems[index].quantity += quantity
        } else {
            cartItems.append(CartItem(product: product, quantity: quantity))
        }
        
        
    }
    
    func removeCartItem(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.name == product.name}) {
            cartItems.remove(at: index)
        }
    }
}
