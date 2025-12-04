//
//  UiState.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

enum Status {
    case initial
    case loading
    case success
    case failure
}

struct UiState {
    let status: Status
    let stores: [Store]
    let message: String?
}

extension UiState {
    
    func copy(status: Status? = nil, stores: [Store]? = nil, message: String? = nil) -> UiState {
        UiState(status: status ?? self.status, stores: stores ?? self.stores, message: message ?? self.message)
    }
    
}
