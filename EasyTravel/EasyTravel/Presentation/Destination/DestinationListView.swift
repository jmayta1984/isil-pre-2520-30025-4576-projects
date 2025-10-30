//
//  DestinationListView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 29/10/25.
//

import SwiftUI

struct DestinationListView: View {
    @StateObject var viewModel = DestinationListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.destinations) { destination in
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
        .navigationBarBackButtonHidden()
        
        
        
    }
}

struct DestinationCard: View {
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: URL(string: destination.posterPath)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    EmptyView()
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .clipped()
            
            VStack (alignment: .leading) {
                Text(destination.title)
                    .font(.headline)
                Text(destination.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }.padding()
        }
    }
}


#Preview {
    DestinationListView()
}
