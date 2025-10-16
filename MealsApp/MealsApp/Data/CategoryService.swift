//
//  CategoryService.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import Foundation

class CategoryService {
    
    static let shared = CategoryService()
    
    private init() {}
    
    func getCategories(completion: @escaping ([Category]?, String?) -> Void) {
        
        let endpoint = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
                        
            if let error = error {
                completion(nil, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Error: invalid response from API")
                return }
            
            guard let data = data else {
                completion(nil, "Error: no data returned from API")
                return }
            
            do {
                let wrapperDto = try JSONDecoder().decode(CategoriesWrapperDto.self, from: data)
                
                let categories = wrapperDto.categories.map { categoryDto in
                    Category(id: categoryDto.id, name: categoryDto.name, posterPath: categoryDto.posterPath)
                }
                completion(categories, nil)
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
