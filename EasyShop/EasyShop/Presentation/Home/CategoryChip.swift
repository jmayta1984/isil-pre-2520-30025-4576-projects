//
//  CategoryChip.swift
//  EasyShop
//
//  Created by Jorge Mayta on 17/09/25.
//

import SwiftUI

struct CategoryChip : View {
    let name: String
    let selected: Bool
    var body: some View {
        Text(name)
            .foregroundStyle(selected ? .white : .black)
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .background(selected ? .black : .gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 16))
    }
}
