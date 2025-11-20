//
//  UiState.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

enum Status {
    case initial
    case loading
    case success
    case failure
}

class UiState {
    let status: Status
    let products: [Product]
    let message: String?
    
    init() {
        self.status = .initial
        self.products = []
        self.message = nil
    }
    
    init(status: Status, products: [Product], message: String? = nil) {
        self.status = status
        self.products = products
        self.message = message
    }
}
