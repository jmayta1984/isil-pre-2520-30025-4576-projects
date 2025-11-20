//
//  ProductService.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import Foundation


enum ApiError: Error {
    case invalidUrl
    case invalidResponse
    case noData
    case decodingError
    case serverError
}

class ProductService {
    static let shared = ProductService()
    private init () {}
    
    func getAllProducts(completion: @escaping (Result<[ProductDto], ApiError>) -> Void) {
        guard let url = URL(string: "\(ApiConstants.baseURL)\(ApiConstants.productsEndpoint)") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let wrapperDto = try JSONDecoder().decode(ProductsWrapperDto.self, from: data)
                let products = wrapperDto.products
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
        
    }
}
