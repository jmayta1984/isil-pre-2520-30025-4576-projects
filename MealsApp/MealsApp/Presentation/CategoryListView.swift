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





#Preview {
    CategoryListView()
}
