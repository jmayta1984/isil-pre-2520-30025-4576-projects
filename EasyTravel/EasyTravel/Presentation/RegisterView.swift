//
//  RegisterView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 22/10/25.
//


import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack (spacing: 16){
            
            TextField("First name", text: $viewModel.firstName)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Last name", text: $viewModel.lastName)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
            
            TextField("Password", text: $viewModel.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
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
