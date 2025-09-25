//
//  Login.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct Login: View {
    @State var isVisible = false
    @State var email = ""
    @State var password = ""

    var body: some View {

        VStack {
            
            
            HStack {
                Image(systemName: "envelope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)                    .frame(height: 24)


            }.padding(20)
            
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(10)
          
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                Group{
                    if (isVisible)  {
                        TextField("Password", text: $password)
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .frame(height: 24)
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye" : "eye.slash")
                }
                    
                
            }.padding(20)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(10)
            
            Button(action: {}) {
                NavigationLink(destination: Main()) {
                    Text("Sign in")
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.background)
                        .background(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                }
                    
            }
            
            
        }
        .navigationBarBackButtonHidden()
        .tint(.primary)
        
        
    }
}

#Preview {
    Login()
}
