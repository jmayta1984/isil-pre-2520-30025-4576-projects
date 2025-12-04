//
//  UiState.swift
//  RickAndMorty
//
//  Created by Jorge Mayta on 3/12/25.
//

enum Status {
    case initial
    case loading
    case success
    case failure
}


struct UiState {
    let status: Status
    let characters: [Character]
    let message: String?
    
    
    init() {
        self.status = .initial
        self.characters = []
        self.message = nil
    }
    
    init(status: Status, characters: [Character], message: String?) {
        self.status = status
        self.characters = characters
        self.message = message
    }
    
    
    func copyWith(
        status: Status? = nil,
        characters: [Character]? = nil,
        message: String? = nil
    ) -> UiState {
        UiState(status: status ?? self.status, characters: characters ?? self.characters, message: message ?? self.message)
    }
    
}
