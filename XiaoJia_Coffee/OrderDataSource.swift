//
//  OrderDataSource.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import Foundation

class OrderDataSource: ObservableObject {
    
    @Published var orders: [CoffeeOrder] = []

    func insertOrder(order: CoffeeOrder) {
        orders.append(order)
    }

    func removeOrder(at index: IndexSet) {
        orders.remove(atOffsets: index)
    }
    
}
