//
//  ProductRepository.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

protocol ProductRepository {
    func getAllProducts(completion: @escaping (Result<[Product], ApiError>) -> Void)
    
    func toggleFavorite(product: Product)
}
