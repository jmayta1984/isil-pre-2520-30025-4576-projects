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
    
    func copy(
        status: Status? = nil,
        products: [Product]? = nil,
        message: String? = nil
    ) -> UiState {
        return UiState(
            status: status ?? self.status,
            products: products ?? self.products,
            message: message ?? self.message
        )
    }
    
    init(
        status: Status = .initial,
        products: [Product] = [],
        message: String? = nil) {
            self.status = status
            self.products = products
            self.message = message
        }
}
