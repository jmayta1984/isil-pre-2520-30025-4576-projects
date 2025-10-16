//
//  CategoryDetailViewModel.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import Foundation

@Observable class CategoryDetailViewModel {
    var meals: [Meal] = []
    let service = MealService.shared
    
    func getMealsByCategory (category: String) {
        service.getMealsByCategory(category: category) { meals, message in
            
            if let meals = meals {
                self.meals = meals
            }
        }
    }
    
    
    
}
