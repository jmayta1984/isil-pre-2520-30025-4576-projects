//
//  CategoriesWrapperDto.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

nonisolated struct CategoriesWrapperDto: Decodable {
    let categories: [CategoryDto]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}

struct CategoryDto: Decodable {
    let id: String
    let name: String
    let posterPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case posterPath = "strCategoryThumb"
        case overview = "strCategoryDescription"
    }
}
