//
//  Banner.swift
//  EasyShop
//
//  Created by Jorge Mayta on 24/09/25.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        HStack {
            VStack {
                Text("Get your special sale today!")
                    .font(.title)
                    .bold()
                
                Button(action: {}) {
                    Text("Shop now")
                        .foregroundStyle(.background)
                        .padding()
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 192)
        }
        .frame(maxWidth: .infinity)
        .tint(.primary)

        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        
    }
}
