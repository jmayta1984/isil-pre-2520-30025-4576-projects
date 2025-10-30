//
//  DestinationListState.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

enum DestinationListState {
    case idle
    case loading
    case success([Destination])
    case failure(String)
}
