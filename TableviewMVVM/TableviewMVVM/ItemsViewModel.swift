//
//  ItemsViewModel.swift
//  TableviewMVVM
//
//  Created by Sai Narayan Goutam Peri on 23/04/24.
//

import Foundation
class ItemsViewModel {
    private let items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Item {
        return items[index]
    }
}
