//
//  ImplicitAnimation.swift
//  EasyAnimations
//
//  Created by Jorge Mayta on 19/11/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State var change = false
    
    var body: some View {
        Circle()
            .fill(change ? .red : .blue )
            .frame(width: change ? 200 : 100,
                   height: change ? 200 : 100)
            .offset(x: change ? 0 : -100,
                    y: change ? 0 : -100)
            .animation(.linear(duration: 1), value: change)
            .onTapGesture {
                change.toggle()
            }
        
        
    }
}

#Preview {
    ImplicitAnimation()
}
