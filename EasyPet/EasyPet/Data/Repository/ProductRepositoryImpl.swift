//
//  ProductRepositoryImpl.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

class ProductRepositoryImpl: ProductRepository {
    
    static let shared = ProductRepositoryImpl()
    
    let service = ProductService.shared
    let dao = ProductDao.shared
    
    private init() {}
    
    func getAllProducts(completion: @escaping (Result<[Product], ApiError>) -> Void) {
    
        
        let favoritesIds = dao.fetchAllIds()
        
        service.getAllProducts { result in
            switch result {
            case .success(let productsDto):
                completion(.success(productsDto.map(
                    { productDto in
                        productDto
                            .toDomain()
                            .copy(isFavorite: favoritesIds.contains(productDto.id))
                    })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func toggleFavorite(product: Product) {
        let favoritesIds = dao.fetchAllIds()

        if (favoritesIds.contains(product.id)) {
            dao.delete(id: product.id)
        } else {
            dao.insert(product: product)
        }
    }
    
    
}
