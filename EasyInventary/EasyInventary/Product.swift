//
//  Product.swift
//  EasyInventary
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftData
import Foundation

@Model
final class Product {
    @Attribute(.unique) var id: UUID
    var name: String
    var quantity: Int
    var price: Double
    
    
    init(name: String, quantity: Int, price: Double) {
        self.id = UUID()
        self.name = name
        self.quantity = quantity
        self.price = price
    }
}
