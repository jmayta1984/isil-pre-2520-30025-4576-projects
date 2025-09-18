//
//  RoundedIcon.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//
import SwiftUI

struct RoundedIcon: View {
    let name: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(systemName: name)
                .font(.title2)
                .tint(.primary)
                .frame(width: 48, height: 48)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        }
        
        
    }
}
