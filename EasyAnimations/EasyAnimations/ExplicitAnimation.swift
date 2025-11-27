//
//  ExplicitAnimation.swift
//  EasyAnimations
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI

struct ExplicitAnimation: View {
    
    @State var isBig = false
    
    var body: some View {
        Rectangle()
            .fill(.green)
            .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
            .onTapGesture {
                withAnimation(.linear(duration: 1)) {
                    isBig.toggle()
                }
            }
        
    }
}

#Preview {
    ExplicitAnimation()
}
