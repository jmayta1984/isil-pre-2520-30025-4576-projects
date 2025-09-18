//
//  Home.swift
//  EasyShop
//
//  Created by Jorge Mayta on 10/09/25.
//

import SwiftUI

struct Home: View {
    
    let categories = ["All", "Men", "Women", "Boys", "Girls"]
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 48, height: 48)
                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundStyle(.background)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Hello Alex")
                        .font(.subheadline)
                    Text("Welcome to EasyShop")
                        .font(.headline)
                }
                Spacer()
                RoundedIcon(name: "bell"){}
                
                RoundedIcon(name: "bag"){}
                
            }.padding(.horizontal)
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    TextField("Search", text: .constant(""))
                }.padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 4)
                
                RoundedIcon(name: "slider.vertical.3"){}
                
            }.padding(.horizontal)
            
            ScrollView(.vertical) {
                HStack {
                    Text("Categories")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    Button(action: {}) {
                        Text("See all")
                            .tint(.primary)
                    }
                    
                }.padding()
                
                ScrollView(.horizontal){
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            CategoryChip(name: category)
                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                }.scrollIndicators(.hidden)
                
                HStack {
                    VStack {
                        Text("Get your special sale today!")
                            .font(.title)
                            .bold()
                        
                        Button(action: {}) {
                            Text("Shop now")
                                .tint(.white)
                                .padding()
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 192)
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                HStack {
                    Text("Products")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    Button(action: {}) {
                        Text("See all")
                            .tint(.primary)
                    }
                    
                }.padding()
                
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(products, id: \.self.name) { product in
                        ProductCard(product: product)
                    }
                }.padding(.horizontal)
            }.scrollIndicators(.hidden)
            
        }
    }
}



#Preview {
    Home()
}
