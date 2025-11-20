//
//  ProductDto.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//
 
nonisolated struct ProductsWrapperDto: Decodable {
    let products: [ProductDto]
    
    enum CodingKeys: String, CodingKey {
        case products = "results"
    }
}

struct ProductDto: Decodable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let price: Double
}

extension ProductDto {
    func toDomain() -> Product {
        Product(id: id,
                title: title,
                description: description,
                image: image,
                price: price)
    }
}
