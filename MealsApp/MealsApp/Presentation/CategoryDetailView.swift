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
                    MealCard(meal: meal).padding(.horizontal, 8)
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

struct MealCard: View {
    let meal: Meal
    var body: some View {
        HStack {
            MealImage(posterPath: meal.posterPath)
            Text(meal.name)
        }
    }
}

struct MealImage: View {
    let posterPath: String
    var body: some View {
        AsyncImage(url: URL(string: posterPath)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                EmptyView()
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 64, height: 64)
        .clipShape(Circle())
    }
}
