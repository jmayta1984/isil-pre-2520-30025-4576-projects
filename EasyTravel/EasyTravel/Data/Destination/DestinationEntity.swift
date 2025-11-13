//
//  DestinationEntity.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftData

@Model
final class DestinationEntity {
    var id: Int
    var title: String
    var posterPath: String
    var overview: String
    
    init(id: Int, title: String, posterPath: String, overview: String) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
    }
}
