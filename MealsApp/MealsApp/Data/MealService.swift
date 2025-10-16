//
//  MealService.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import Foundation

class MealService {
    
    static let shared = MealService()
    
    private init() {}
    
    func getMealsByCategory(category: String,
                            completion: @escaping ([Meal]?, String?) -> Void) {
        
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        
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
                let wrapperDto = try JSONDecoder().decode(MealsWrapperDto.self, from: data)
                
                let meals = wrapperDto.meals.map { mealDto in
                    Meal(id: mealDto.id, name: mealDto.name, posterPath: mealDto.posterPath)
                }
                completion(meals, nil)
            } catch let error {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
