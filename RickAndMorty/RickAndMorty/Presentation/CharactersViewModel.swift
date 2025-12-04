//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Jorge Mayta on 3/12/25.
//

import Combine
import Foundation

class CharactersViewModel: ObservableObject {
    
    
    @Published var uiState = UiState()
    let service = CharacterService.shared
    
    func searchCharacters(query: String) {
        
        uiState = uiState.copyWith(status: .loading)
        
        service.searchCharacters(query: query) { result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(characters: characters)
                }
            case .failure (let error):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copyWith(message: error.rawValue)
                }
            }
        }
        
    }
    
}
