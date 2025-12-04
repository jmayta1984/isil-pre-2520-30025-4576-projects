//
//  StoreDto.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

struct StoreDto: Decodable {
    let id: Int
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
}

extension StoreDto {
    
    func toDomain() -> Store {
        Store(id: id, name: name, description: description, latitude: latitude, longitude: longitude)
    }
}
