//
//  DestinationListViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import Foundation
import Combine

class DestinationListViewModel: ObservableObject {
    
    @Published var destinations: [Destination] = []
    
    func getDestinations() {
        let destinationService = DestinationService.shared
        
        destinationService.getDestinations { destinations, message in
            if let destinations = destinations {
                DispatchQueue.main.async {
                    self.destinations = destinations
                }
            }
            print(message ?? "Unknown error")
        }
    }
    
    init() {
        getDestinations()
    }
}

