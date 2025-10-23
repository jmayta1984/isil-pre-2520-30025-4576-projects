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
        List {
            Section {
                VStack (alignment: .leading, spacing: 8){
                    CategoryImage(poster: category.posterPath)

                    Text("Description")
                        .font(.title3)
                        .bold()
                    
                    Text(category.overview)
                        .font(Font.subheadline)

                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
            .listSectionSeparator(.hidden)
            Section {
                ForEach(viewModel.meals) { meal in
                    Text(meal.name).padding(.horizontal)
                }
                .listRowSeparator(.hidden)
            }
            .listSectionSeparator(.hidden)

            
        }
        .listStyle(.plain)
        .navigationTitle(category.name)
        .onAppear {
            viewModel.getMealsByCategory(category: category.name)
        }
        
    }
}
