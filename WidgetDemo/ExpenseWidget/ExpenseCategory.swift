//
//  ExpenseCategory.swift
//  WidgetDemo
//
//  Created by Piyush Sinroja on 16/06/23.
//

import Foundation

enum ExpenseCategory: Int {
    case all = 1
    case food
    case grocery
    case gas
    case rent
    
    var desc: String {
        switch self {
        case .all:
            return "All Expenses"
        case .food:
            return "Food Expenses"
        case .grocery:
            return "Grocery Expenses"
        case .gas:
            return "Gas Expenses"
        case .rent:
            return "Rent Expenses"
        }
    }
}
