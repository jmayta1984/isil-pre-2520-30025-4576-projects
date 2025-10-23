//
//  RegisterViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 22/10/25.
//

import Foundation
import Combine


class RegisterViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    
    func register() {
        let service = AuthService.shared
        
        service.register(requestBody:
                            RegisterRequestDto(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                password: password)) { success, message in
                                    DispatchQueue.main.async {
                                        self.message = message
                                    }
        }
    }
}
