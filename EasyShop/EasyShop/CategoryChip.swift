//
//  CategoryChip.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//

import SwiftUI

struct CategoryChip : View {
    let name: String
    var body: some View {
        Text(name)
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}
