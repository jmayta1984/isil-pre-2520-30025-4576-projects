//
//  CategoryDetailView.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    @State var viewModel = CategoryDetailViewModel()
    
    var body: some View {
        VStack {
            CategoryImage(poster: category.posterPath)
            
            
            VStack (alignment: .leading, spacing: 8){
                
                Text("Description")
                    .font(.title3)
                    .bold()
                   
                Text(category.overview)
                    
            }
            .padding()
            .font(Font.subheadline)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            List {
                ForEach(viewModel.meals) { meal in
                    Text(meal.name)
                }
            }.listStyle(.plain)
        }
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getMealsByCategory(category: category.name)
        }
        
    }
}
