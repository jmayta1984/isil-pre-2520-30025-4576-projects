//
//  CharacterDto.swift
//  RickAndMorty
//
//  Created by Jorge Mayta on 3/12/25.
//



struct CharacterDto: Decodable {
    let id: Int
    let name: String
    let image: String
    let species: String
}

nonisolated struct CharactersWrapperDto: Decodable {
    let characters: [CharacterDto]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}


extension CharacterDto {
    func toDomain() -> Character {
        Character(id: id,
                  name: name,
                  image: image,
                  species: species)
    }
}
