//
//  ProductCard.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(
                url: URL(string: product.image),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                },
                placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                }
            )
            .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 32))
            Text(product.name).padding(.horizontal).lineLimit(1)
            Text("$ \(String(product.price))").bold().padding(.horizontal)
        }
    }
}


#Preview {
    ScrollView(.vertical) {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]) {
            ForEach(products, id: \.self.name) { product in
                ProductCard(product: product)
            }
        }
    }
}
