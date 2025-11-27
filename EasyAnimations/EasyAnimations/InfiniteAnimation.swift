//
//  InfiniteAnimation.swift
//  EasyAnimations
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI

struct InfiniteAnimation: View {
    @State var rotate = false
    var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .resizable()
            .scaledToFit()
            .rotationEffect(Angle(degrees: rotate ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: rotate)
            .onTapGesture {
                rotate.toggle()
            }
    }
}

#Preview {
    InfiniteAnimation()
}
