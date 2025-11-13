//
//  ProductListView.swift
//  EasyInventary
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    @Environment(\.modelContext) var context
    @State var showAddProduct = false
    
    @Query var products: [Product]
    @State var selectedProduct: Product?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(products) { product in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(product.name).bold()
                            Text("Quantity: \(product.quantity)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Text("\(product.price, specifier: "$ %.2f")").bold()
                    }
                    .background()
                    .onTapGesture {
                        selectedProduct = product
                    }
                    
                    .swipeActions {
                        Button(role: .destructive) {
                            context.delete(product)
                            try? context.save()
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }
                        
                    }
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddProduct.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showAddProduct) {
                ProductDetailView()
            }
            .navigationDestination(item: $selectedProduct) { product in
                ProductDetailView(product: product)
            }
        }
    }
}

#Preview {
    ProductListView()
}

