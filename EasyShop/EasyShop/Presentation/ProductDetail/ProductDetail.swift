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
    @State var showConfirmation = false
    
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
                    showConfirmation.toggle()
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
        .sheet(isPresented: $showConfirmation) {
            CartItemConfirmation(product: product, quantity: viewModel.quantity)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .presentationDetents([.fraction(0.35)])
        }
        
    }
}


#Preview {
    ProductDetail(product: products[1])
        .environmentObject(CartViewModel())
}


struct CartItemConfirmation: View {
    @EnvironmentObject var router: AppRouter

    let product: Product
    let quantity: Int
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
            
            
            Button(action: {
                router.selectedTab = 2
                
            }) {
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

