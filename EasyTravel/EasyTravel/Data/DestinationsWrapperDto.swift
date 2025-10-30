//
//  DestinationsWrapperDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

nonisolated struct DestinationsWrapperDto: Decodable {
    
    let count: Int
    let destinations: [DestinationDto]
    
    enum CodingKeys: String, CodingKey {
        case count
        case destinations = "results"
    }
}


struct DestinationDto: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let city: String
    let country: String
    let rating: Double
    
}
