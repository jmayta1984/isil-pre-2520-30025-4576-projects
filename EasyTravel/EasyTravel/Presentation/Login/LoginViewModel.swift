//
//  LoginViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    
    func login() {
        let service = AuthService.shared
        
        service.login(
            requestBody: LoginRequestDto(
                email: email,
                password: password)) { success, message in
                    DispatchQueue.main.async {
                        self.message = message
                    }
                }
    }
}
