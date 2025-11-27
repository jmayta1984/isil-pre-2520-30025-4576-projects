//
//  TransitionAnimation.swift
//  EasyAnimations
//
//  Created by Jorge Mayta on 19/11/25.
//

import SwiftUI

struct TransitionAnimation: View {
    
    @State var show = false
    
    var body: some View {
      
        VStack {
            if show {
                Rectangle()
                    .transition(.scale.combined(with: .opacity))
                    .frame(width: 100, height: 100)
            }
            Button {
                withAnimation {
                    show.toggle()
                }
                
            } label: {
                Text("Show")
            }

        }
    }
}

#Preview {
    TransitionAnimation()
}
