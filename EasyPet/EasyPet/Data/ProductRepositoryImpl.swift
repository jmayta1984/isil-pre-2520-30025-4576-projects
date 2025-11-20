//
//  ProductRepositoryImpl.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

class ProductRepositoryImpl: ProductRepository {
    
    static let shared = ProductRepositoryImpl()
    private init() {}
    
    func getAllProducts(completion: @escaping (Result<[Product], ApiError>) -> Void) {
        let service = ProductService.shared
        
        service.getAllProducts { result in
            switch result {
            case .success(let productsDto):
                completion(.success(productsDto.map({ $0.toDomain() })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
