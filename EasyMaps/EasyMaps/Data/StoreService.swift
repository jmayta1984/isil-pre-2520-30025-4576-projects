//
//  StoreService.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//


enum ApiError: String, Error {
    case invalidURL = "Invalid URL"
    case serverError = "Server error"
    case noData = "No data"
    case invalidResponse = "Invalid response"
    case decodingError = "Decoding error"
}

import Foundation

class StoreService {
    static let shared = StoreService()
    private init() {}
    
    func getAllStores(completion: @escaping (Result<[Store], ApiError>) -> Void) {
        guard let url = URL(string: ApiConstants.baseUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
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
                let dtos = try JSONDecoder().decode([StoreDto].self, from: data)
                let stores = dtos.map { dto in
                    dto.toDomain()
                }
                completion(.success(stores))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
        
    }
}
