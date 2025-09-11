//
//  Login.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct Login: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "envelope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                TextField("Email", text: .constant(""))
            }.padding(20)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(10)
          
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                TextField("Password", text: .constant(""))
            }.padding(20)
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(10)
            
            Button(action: {}) {
                Text("Sign in")
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                    
            }
            
            
        }
        
        
        
    }
}

#Preview {
    Login()
}
