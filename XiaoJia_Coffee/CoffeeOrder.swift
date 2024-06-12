//
//  Order.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import Foundation

struct CoffeeOrder: Identifiable {
    
    enum CoffeeType: String, CaseIterable {
        case darkRoast = "Dark Roast"
        case originalBlend = "Original Blend"
        case vanilla = "Vanilla"
    }
    
    enum CoffeeSize: String, CaseIterable {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
    
    
    var id: UUID = UUID()
    
    var userName: String
    var coffeeType: CoffeeType
    var coffeeSize: CoffeeSize
    var quantity: Int
    var isCompleted: Bool
    
    var price: Double {
        let unitPrice: Double
        switch coffeeSize {
        case .small:
            unitPrice = 1.97
        case .medium:
            unitPrice = 2.97
        case .large:
            unitPrice = 3.97
        }
        return unitPrice * Double(quantity)
    }
}
