//
//  DestinationListViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import Foundation
import Combine

class DestinationListViewModel: ObservableObject {
    
    @Published var category = "All"
    @Published var state: DestinationListState = .idle
    
    let service = DestinationService.shared
    let dao = DestinationDao.shared
    
    
    func getDestinations() {
        state = .loading
        
        let query = category == "All" ? "": category
        service.getDestinations(query: query) { destinations, message in
            if let destinations = destinations {
                DispatchQueue.main.async {
                    self.state = .success(destinations)
                }
            }
        }
    }
    
    func onCategoryChange(category: String) {
        self.category = category
        getDestinations()
    }
    
    func toggleFavorite(destination: Destination) {
        let isFavorite = isFavorite(destination: destination)
        
        if isFavorite {
            dao.delete(destination: destination)
        } else {
            dao.insert(destination: destination)
        }
        let query = category == "All" ? "": category

        service.getDestinations(query: query) { destinations, message in
            if let destinations = destinations {
                DispatchQueue.main.async {
                    self.state = .success(destinations)
                }
            }
        }

        
    }
    
    func isFavorite (destination: Destination) -> Bool {
        dao.getAll().contains { entity in
            entity.id == destination.id
        }
    }
    
    
    init() {
        getDestinations()
    }
}

