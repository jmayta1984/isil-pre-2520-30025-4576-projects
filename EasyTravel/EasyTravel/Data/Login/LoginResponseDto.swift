//
//  LoginResponseDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

nonisolated struct LoginResponseDto: Decodable {
    let firstName: String
    let lastName: String
    let token: String
    let email: String
}
