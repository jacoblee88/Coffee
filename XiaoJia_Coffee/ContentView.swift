//
//  ContentView.swift
//  XiaoJia_Coffee
//
//  Created by Jacob Lee on 2024-06-11.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var orderDataSource = OrderDataSource()

    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(orderDataSource.orders) { order in
                        if !order.isCompleted {
                            ListItemView(order: order)
                                .environmentObject(orderDataSource)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        orderDataSource.removeOrder(at: indexSet)
                    })
                }
                
            }
            .navigationBarTitle("Xiaojia")
            .toolbar(content: {
                NavigationLink {
                    NewOrderView()
                        .environmentObject(orderDataSource)
                } label: {
                    Text("New Order")
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
