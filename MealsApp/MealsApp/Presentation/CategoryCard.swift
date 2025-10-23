//
//  CategoryCard.swift
//  MealsApp
//
//  Created by Jorge Mayta on 22/10/25.
//

import SwiftUI

struct CategoryCard: View {
    let category: Category
    var body: some View {
        
        VStack {
            CategoryImage(poster: category.posterPath)
            
            Text(category.name)
                .font(.title3)
                .bold()
                .padding(.vertical,16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(.top)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}
