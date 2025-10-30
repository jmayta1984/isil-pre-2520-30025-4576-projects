//
//  LoginView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack (spacing: 16){
            
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .frame(height: 24)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            HStack {
                Group {
                    if isPasswordVisible {
                        TextField("Password", text: $viewModel.password)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    } else {
                        SecureField("Password", text: $viewModel.password)
                    }
                }
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye": "eye.slash")
                }
                .tint(Color(uiColor: .label))
            }
            .frame(height: 24)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
                
            
            Button {
                viewModel.login()
            } label: {
                Text("Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .label))
                    .foregroundStyle(Color(uiColor: .systemBackground))

                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    .padding(.horizontal)
            }
            
            Text(viewModel.message)

        
        }
    }
}

#Preview {
    LoginView()
}
