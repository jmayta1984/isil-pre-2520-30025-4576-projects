//
//  StoreCard.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI

struct StoreCard: View {
    let store: Store
    var body: some View {
        VStack(alignment:.leading) {
            Text(store.name).bold()
            Text(store.description).lineLimit(1)
        }
    }
}
