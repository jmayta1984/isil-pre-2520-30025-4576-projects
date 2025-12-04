//
//  StoresViewModel.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import Combine
import Foundation

class StoresViewModel: ObservableObject {
    let service = StoreService.shared
    
    @Published var uiState = UiState(status: .initial, stores: [], message: nil)
    
    func getAllStores() {
        uiState = uiState.copy(status: .loading)
        service.getAllStores { result in
            switch result {
            case .success(let stores):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copy(status: .success, stores: stores)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copy(status: .failure, message: error.rawValue)
                }
            }
        }
    }
    
    
    init() {
        getAllStores()
    }
}
