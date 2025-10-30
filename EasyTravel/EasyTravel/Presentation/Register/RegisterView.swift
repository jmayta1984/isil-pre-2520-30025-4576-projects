//
//  RegisterView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 22/10/25.
//


import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack (spacing: 16){
            
            TextField("First name", text: $viewModel.firstName)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .frame(height: 24)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Last name", text: $viewModel.lastName)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .frame(height: 24)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
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
                viewModel.register()
            } label: {
                Text("Register")
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
    RegisterView()
}
