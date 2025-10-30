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
    
    func getDestinations() {
        state = .loading
        let destinationService = DestinationService.shared
        
        let query = category == "All" ? "": category
        destinationService.getDestinations(query: query) { destinations, message in
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
    
    init() {
        getDestinations()
    }
}

