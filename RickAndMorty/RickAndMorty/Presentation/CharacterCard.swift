//
//  CharacterCard.swift
//  RickAndMorty
//
//  Created by Jorge Mayta on 3/12/25.
//

import SwiftUI

struct CharacterCard: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               
                AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure (let error):
                        Text(error.localizedDescription)
                    case .empty:
                        ProgressView()
                    @unknown default:
                        Image(systemName: "person.crop.circle")
                            .resizable()
                    }
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Text(character.name)
                   
            }
        }
    }
}
