//
//  ExpenseWidgetView.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 16/06/23.
//

import SwiftUI
import WidgetKit
struct ExpenseWidgetView: View {
    
    let category: ExpenseCategory
    
    var body: some View {
        switch category {
        case .all:
            ExpenseItemView(label: "Total Expense", amount: 5000, budget: 7000, color: .red)
        case .food:
            ExpenseItemView(label: "Food Expense", amount: 1000, budget: 1500, color: .orange)
        case .grocery:
            ExpenseItemView(label: "Grocery Expense", amount: 1000, budget: 1500, color: .indigo)
        case .gas:
            ExpenseItemView(label: "Gas Expense", amount: 500, budget: 1000, color: .red)
        case .rent:
            ExpenseItemView(label: "Rent Expense", amount: 2500, budget: 3000, color: .mint)
        }
    }
}

struct ExpenseWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ExpenseWidgetView(category: .all)
            ExpenseWidgetView(category: .food)
            ExpenseWidgetView(category: .gas)
            ExpenseWidgetView(category: .grocery)
            ExpenseWidgetView(category: .rent)
        }.previewContext(WidgetPreviewContext(family: .systemSmall))
        
        
    }
}
