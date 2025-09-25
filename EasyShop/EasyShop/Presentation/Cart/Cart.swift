//
//  Cart.swift
//  EasyShop
//
//  Created by Jorge Mayta on 24/09/25.
//

import SwiftUI

struct Cart: View {
    
    var cartItems: [CartItem] = [
        CartItem(product: products[0], quantity: 5),
        CartItem(product: products[1], quantity: 3),
        CartItem(product: products[2], quantity: 10)
    ]
    
    var body: some View {
        ZStack (alignment:.bottom){
            List {
                ForEach(cartItems, id:\.self.product.name) { item in
                    CartItemCard(item: item)
                    
                }
                .onDelete { _ in 
                    
                }
                .listRowSeparator(.hidden)
            }.listStyle(.plain)
            
            VStack{
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text("$ \(cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }, specifier: "%.2f")")
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
    Cart()
}
