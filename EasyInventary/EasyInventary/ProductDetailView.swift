//
//  Untitled.swift
//  EasyInventary
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftUI
import SwiftData

struct ProductDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State var name = ""
    @State var quantity = 0
    @State var price = 0.0
    
    @State var product: Product?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    Stepper(value: $quantity, in: 0...100) {
                        TextField("Quantity", value: $quantity, formatter: NumberFormatter(), prompt: Text("Quantity")).keyboardType(.numberPad)
                    }
                    TextField("Price", value: $price, format: .number).keyboardType(.decimalPad)
                }
            }
            .navigationTitle(product == nil ? "New product" : "Edit product")
            .toolbar {
                if (product == nil) {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        if let product {
                            product.name = name
                            product.quantity = quantity
                            product.price = price
                        } else  {
                            context.insert(Product(name: name, quantity: quantity, price: price))
                        }
                        try? context.save()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    
                }
            }
        }
        .onAppear {
            name = product?.name ?? ""
            quantity = product?.quantity ?? 0
            price = product?.price ?? 0.0
        }
    }
}

#Preview {
    ProductDetailView()
}
