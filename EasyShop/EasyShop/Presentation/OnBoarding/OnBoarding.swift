//
//  OnBoarding.swift
//  EasyShop
//
//  Created by Jorge Mayta on 24/09/25.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Image("intro")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text("Create account")
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.background)
                        .background(.primary)
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
                
            
                Button(action: {}) {
                    NavigationLink(destination: Login()) {
                        Text("Sign in")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.primary)
                            .background(.background)
                            .cornerRadius(16)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(lineWidth: 1)
                            }
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
            .tint(.primary)
        }

    }
}

#Preview {
    OnBoarding()
        .environmentObject(CartViewModel())
        .environmentObject(AppRouter())
}
