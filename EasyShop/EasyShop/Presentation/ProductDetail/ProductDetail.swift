//
//  ProductDetail.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//

import SwiftUI

struct ProductDetail: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    
    let product: Product
        
    var body: some View {
        ZStack(alignment:.bottom) {
            ScrollView(.vertical) {
                VStack {
                    AsyncImage(
                        url: URL(string: product.image),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height: 240)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(.horizontal)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(height: 240)
                        }
                    )
                    
                    HStack {
                        Text(product.name)
                            .font(.headline)
                        Spacer()
                        Text("$ \(String(product.price))")
                            .font(.headline)
                        
                    }.padding()
                    
                    HStack {
                        Spacer()
                        RoundedIcon(name: "minus") {
                            viewModel.decreaseQuantity()
                        }
                            
                        Text("\(viewModel.quantity)")
                            .frame(width: 24)
                        RoundedIcon(name: "plus") {
                            viewModel.increaseQuantity()
                        }
                            
                    }.padding(.horizontal)
                    
                    HStack {
                        Text("Description")
                            .font(.headline)
                            .bold()
                        
                        Spacer()
                        
                    }.padding()
                    
                    Text(product.description)
                        .padding(.horizontal)
                    
                    
                }
                
            }
            HStack{
                Button(action: {
                    cartViewModel.addCartItem(product: product, quantity: viewModel.quantity)
                }) {
                    Text("Add to cart")
                        .frame(maxWidth: .infinity)
                        .tint(.primary)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke( lineWidth: 1)
                                .fill(.black)
                        }
                }
                
                Button(action: {}) {
                    Text("Buy now")
                        .frame(maxWidth: .infinity)
                        .tint(.white)
                        .padding()
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                }
            }.padding()
        }
        
    }
}


#Preview {
    ProductDetail(product: products[1])
        .environmentObject(CartViewModel())
}
