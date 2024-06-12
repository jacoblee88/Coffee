//
//  ListItemView.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import SwiftUI

struct ListItemView: View {
    
    var order: CoffeeOrder
    
    @EnvironmentObject var orderDataSource: OrderDataSource
    
    var body: some View {
        NavigationLink {
            OrderDetailView(order: order)
                .environmentObject(orderDataSource)
        } label: {
            VStack(alignment: .leading,
                   spacing: 15) {
                Text(order.coffeeType.rawValue)
                    .font(.title2)
                    .bold()
                Text(order.coffeeSize.rawValue)
                    .font(.title3)
            }.onTapGesture {
                print(#function, "list item selected: \(order.userName)")
            }
        }
    }
}
