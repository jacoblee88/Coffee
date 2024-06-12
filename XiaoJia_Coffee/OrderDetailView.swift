//
//  OrderDetailView.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import SwiftUI

struct OrderDetailView: View {
    @State var order: CoffeeOrder
    
    @EnvironmentObject var orderDataSource: OrderDataSource
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack {
            Form {
                Section {
                    HStack{
                        Text("User Name")
                        Spacer()
                        Text(order.userName)
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    HStack{
                        Text("Coffee Type")
                        Spacer()
                        Text(order.coffeeType.rawValue)
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    HStack{
                        Text("Coffee Size")
                        Spacer()
                        Text(order.coffeeSize.rawValue)
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    HStack{
                        Text("Quantity")
                        Spacer()
                        Text("\(order.quantity)")
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    HStack{
                        Text("Price")
                        Spacer()
                        Text(String(format: "%.2f", order.price))
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                    Toggle("Completed", isOn: $order.isCompleted)
                        .onChange(of: order.isCompleted) {
                            // Handle change in completion status
                            if let selectedIndex = orderDataSource.orders.firstIndex(where: { $0.id == self.order.id }) {
                                
                                orderDataSource.orders[selectedIndex] = order
                                dismiss()
                            }
                        }
                }
                
            }
            
        }.navigationBarTitle("Order Details")
        
    }
}

//#Preview {
//    OrderDetailView()
//}
