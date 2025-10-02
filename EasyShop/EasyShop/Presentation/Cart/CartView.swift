//
//  CartView.swift
//  EasyShop
//
//  Created by Jorge Mayta on 24/09/25.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        ZStack (alignment:.bottom){
            List {
                ForEach(viewModel.cartItems, id:\.self.product.name) { item in
                    CartItemCard(item: item)
                        .listRowInsets(.init())
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .trailing) {
                                       Button(role: .destructive) {
                                           viewModel.removeCartItem(product: item.product)
                                       } label: {
                                           Label("Remove", systemImage: "trash")
                                       }
                                   }
                    
                }

                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .listRowSpacing(10)
            
            VStack{
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text("$ \(viewModel.cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }, specifier: "%.2f")")
                        .font(.headline)
                }
                .padding(.top)
                .padding(.horizontal)

                Button(action: {}) {
                    Text("Check out")
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.background)
                        .background(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                    
                    
                }
                .padding(.bottom)
            }
            .border(Color.gray.opacity(0.2), width: 1)
            .padding(.bottom, 32)
        }
        .tint(.primary)
    }
}


#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
