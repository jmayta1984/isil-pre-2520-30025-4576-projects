//
//  CartItemCard.swift
//  EasyShop
//
//  Created by Jorge Mayta on 24/09/25.
//

import SwiftUI

struct CartItemCard: View {
    
    let item: CartItem
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: item.product.image),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 56, height: 56)
                },
                placeholder: {
                    ProgressView()
                        .frame(width: 56, height: 56)
                })
            
            VStack(alignment: .leading){
                
                Text(item.product.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("Quantity: \(item.quantity)")
                Text("$ \(item.product.price, specifier: "%.2f")")
                    .font(.headline)
                    .background(.background)
            }
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1))
    }
}
