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
                RoundedIcon(name: "bell")
                
                RoundedIcon(name: "bag")
                
            }.padding()
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    TextField("Search", text: .constant(""))
                }.padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                RoundedIcon(name: "slider.vertical.3")
            }.padding()
            
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
                Text("Get your special sale today!")
                    .font(.title)
                    .bold()
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 192)
            }
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
            .padding()
            
            Spacer()
        }
    }
}


struct CategoryChip : View {
    let name: String
    var body: some View {
        Text(name)
            .font(.title2)
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct RoundedIcon: View {
    let name: String
    
    var body: some View {
        Image(systemName: name)
            .font(.title2)
            .frame(width: 48, height: 48)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Home()
}
