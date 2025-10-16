//
//  CategoryListViewModel.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import Foundation

@Observable class CategoryListViewModel {
    var categories: [Category] = []
    let service = CategoryService.shared
    
    func getCategories () {
        service.getCategories { categories, message in
            
            if let categories = categories {
                self.categories = categories
            }
        }
    }
    
    init () {
        getCategories()
    }
    
    
}
