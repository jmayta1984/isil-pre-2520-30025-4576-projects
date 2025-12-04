//
//  StoresView.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI

struct StoresView: View {
    
    @StateObject var viewModel = StoresViewModel()
    @State var selectedStore: Store?
    
    var body: some View {
        let uiState = viewModel.uiState
        VStack {
            
            switch uiState.status {
            case .initial:
                EmptyView()
                
            case .loading:
                ProgressView()
            case .success:
                List {
                    ForEach(uiState.stores) { store in
                        StoreCard(store: store)
                            .onTapGesture {
                                selectedStore = store
                            }
                    }
                }
                .listStyle(.plain)
                .sheet(item: $selectedStore) { store in
                    GoolgeMapView(latitude: store.latitude, longtitude: store.longitude, title: store.name, description: store.description)
                        .ignoresSafeArea()
                        .presentationDetents([.fraction(0.85)])
                }
            case .failure:
                Text(viewModel.uiState.message ?? "Unknown error")
            }
        }
    }
}

#Preview {
    StoresView()
}
