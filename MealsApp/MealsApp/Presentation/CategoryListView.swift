//
//  CategoryListView.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import SwiftUI

struct CategoryListView: View {
    @State var viewModel = CategoryListViewModel()
    @State var selectedCategory: Category?
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.categories) { category in
                    CategoryCard(category: category)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
            .navigationDestination(item: $selectedCategory) { category in
                CategoryDetailView(category: category)
            }
        }
        
    }
}

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

struct CategoryImage: View {
    let poster: String
    var body: some View {
        AsyncImage(
            url: URL(string: poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
            }
    }
}

#Preview {
    CategoryListView()
}
