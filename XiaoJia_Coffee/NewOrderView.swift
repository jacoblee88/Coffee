//
//  NewOrderView.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import SwiftUI

struct NewOrderView: View {
    @EnvironmentObject var orderDataSource: OrderDataSource

    @State private var userName = ""
    @State private var coffeeType = CoffeeOrder.CoffeeType.darkRoast
    @State private var coffeeSize = CoffeeOrder.CoffeeSize.small
    @State private var quantity = 1
    @State private var isCompleted = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("User Information")) {
                TextField("User Name", text: $userName)
            }
            
            Section(header: Text("Order Details")) {
                Picker("Coffee Type", selection: $coffeeType) {
                    ForEach(CoffeeOrder.CoffeeType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                Picker("Coffee Size", selection: $coffeeSize) {
                    ForEach(CoffeeOrder.CoffeeSize.allCases, id: \.self) { size in
                        Text(size.rawValue)
                    }
                }
                Stepper(value: $quantity, in: 1...10) {
                    Text("Quantity: \(quantity)")
                }
                Toggle("Completed", isOn: $isCompleted)
            }
            
            Button("Add Order") {
                let newOrder = CoffeeOrder(
                    userName: userName,
                    coffeeType: coffeeType,
                    coffeeSize: coffeeSize,
                    quantity: quantity,
                    isCompleted: isCompleted)
                orderDataSource.insertOrder(order: newOrder)
                dismiss()
            }
        }
        .navigationBarTitle("New Order")
    }
}

//#Preview {
//    NewOrderView()
//}
