//
//  CartItemConfirmation.swift
//  EasyShop
//
//  Created by Jorge Mayta on 2/10/25.
//

import SwiftUI

struct CartItemConfirmation: View {
    let product: Product
    let quantity: Int
    let action: () -> Void

    var body: some View {
        VStack (alignment: .leading){
            Text("ADDED TO CART")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            HStack {
                AsyncImage(
                    url: URL(string: product.image),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 96, height: 96)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(width: 96, height: 96)
                    }
                )
                VStack (alignment: .leading) {
                    Text("$ \(product.price, specifier: "%.2f")")
                        .font(.headline)
                        .background(.background)
                    Text(product.name)
                        .bold()
                    Text("Quantity: \(quantity)")
                }
            }
            .padding(.horizontal)
            
            
            Button(action: action) {
                Text("View cart")
                    .frame(maxWidth: .infinity)
                    .tint(.white)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
            }
            
        }
    }
}

