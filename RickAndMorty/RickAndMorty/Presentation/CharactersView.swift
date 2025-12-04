//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Jorge Mayta on 3/12/25.
//

import SwiftUI

struct CharactersView: View {
    
    @State var query = ""
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            
            List {
                Section {
                    TextField("Search", text: $query)
                        .onSubmit {
                            viewModel.searchCharacters(query: query)
                        }
                }
                
                ForEach(viewModel.uiState.characters) { character in
                    CharacterCard(character: character)
                }
                
            }
        }
    }
}
