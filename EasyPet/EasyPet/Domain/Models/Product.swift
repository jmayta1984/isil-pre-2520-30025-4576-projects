//
//  Product.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

struct Product: Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let price: Double
    let isFavorite: Bool
    
    func copy(
        id: Int? = nil,
        title: String? = nil,
        description: String? = nil,
        image: String? = nil,
        price: Double? = nil,
        isFavorite: Bool? = nil
    ) -> Product {
        Product(
            id: id ?? self.id,
            title: title ?? self.title,
            description: description ?? self.description,
            image: image ?? self.image,
            price: price ?? self.price,
            isFavorite: isFavorite ?? self.isFavorite
        )
    }
}
