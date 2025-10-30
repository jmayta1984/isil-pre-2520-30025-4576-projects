//
//  RegisterRequestDto.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 22/10/25.
//

struct RegisterRequestDto: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
