//
//  CategoryImage.swift
//  MealsApp
//
//  Created by Jorge Mayta on 22/10/25.
//

import SwiftUI

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
