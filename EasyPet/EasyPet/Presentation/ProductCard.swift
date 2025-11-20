//
//  ProductCard.swift
//  EasyPet
//
//  Created by Jorge Mayta on 19/11/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .tint(Color(uiColor: .label))
                        .font(.title2)
                }

            }
            
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            
            Text(product.title,)
                .font(.headline)
                .lineLimit(1)
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
        }
        .padding(8)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        
    }
}
