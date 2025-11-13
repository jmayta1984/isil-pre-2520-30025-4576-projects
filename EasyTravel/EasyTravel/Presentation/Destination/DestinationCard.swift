//
//  DestinationCard.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 12/11/25.
//

import SwiftUI

struct DestinationCard: View {
    let destination: Destination
    @EnvironmentObject var viewModel: DestinationListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack (alignment: .topTrailing){
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
                
                Button {
                    viewModel.toggleFavorite(destination: destination)
                } label: {
                    Image(systemName: viewModel.isFavorite(destination: destination) ? "heart.fill" : "heart")
                }
                .buttonStyle(.glass)
                .padding(8)

            }
           
            
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
