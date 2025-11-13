//
//  DestinationListView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import SwiftUI

struct DestinationListView: View {
    @EnvironmentObject var viewModel: DestinationListViewModel
    
    let categories = ["All", "Beach", "Adventure", "City", "Cultural"]
    
    
    var body: some View {
        VStack {
            
            ScrollView (.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        FilterChip(isSelected: category == viewModel.category, title: category)
                            .onTapGesture {
                                viewModel.onCategoryChange(category: category)
                            }
                    }
                }
                .padding(.horizontal, 8)
            }
            .scrollIndicators(.hidden)
            
            switch viewModel.state {
            case .loading:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .success(let destinations):
                List {
                    ForEach(destinations) { destination in
                        DestinationCard(destination: destination)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 4, x: 0, y: 1)
                        
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8))
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            case .idle, .failure(_):
                EmptyView()
            }
                
            
            
        }
        .navigationBarBackButtonHidden()
    }
}


struct FilterChip: View {
    let isSelected: Bool
    let title: String
    var body: some View {
        Text(title)
            .padding()
            .background(Color(uiColor: isSelected ? .label : .secondarySystemBackground))
            .foregroundStyle(Color(uiColor: isSelected ? .systemBackground : .label))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}




#Preview {
    DestinationListView().environmentObject(DestinationListViewModel())
}
