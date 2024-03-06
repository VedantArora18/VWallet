//
//  Item.swift
//  VWallet
//
//  Created by Vedant Arora on 05/03/24.
//

import SwiftUI

struct Item: Identifiable{
    var id:UUID = .init()
    var color: Color
    
}

var items: [Item] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
]

extension [Item] {
    func zIndex(_ item: Item) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }
        
        return .zero
    }
}
