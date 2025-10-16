//
//  CategoryListView.swift
//  MealsApp
//
//  Created by Jorge Mayta on 15/10/25.
//

import SwiftUI

struct CategoryListView: View {
    @State var viewModel = CategoryListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.categories) { category in
                CategoryCard(category: category)
                    .listRowSeparator(.hidden)
            }
        }.listStyle(.plain)
    }
}


struct CategoryCard: View {
    let category: Category
    var body: some View {
        
        VStack {
            AsyncImage(
                url: URL(string: category.posterPath)) { image in
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

            Text(category.name)
                .font(.title3)
                .bold()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    CategoryListView()
}
