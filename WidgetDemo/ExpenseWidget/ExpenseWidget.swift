//
//  ExpenseWidget.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 16/06/23.
//

import SwiftUI
import WidgetKit

struct ExpenseEntry: TimelineEntry {
    let date = Date()
    let category: ExpenseCategory
}

struct ExpenseWidgetTimeLineProvider: IntentTimelineProvider {
    typealias Entry = ExpenseEntry
    typealias Intent = MonthlyExpenseIntent
    
    private func category(for config: MonthlyExpenseIntent) -> ExpenseCategory {
        switch config.category {
        case .unknown:
            return .all
        case .food:
            return .food
        case .gas:
            return .gas
        case .grocery:
            return .grocery
        case .rent:
            return .rent
        case .all:
            return .all
        }
    }
    
    func placeholder(in context: Context) -> ExpenseEntry {
        ExpenseEntry(category: .all)
    }
    
    func getSnapshot(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (ExpenseEntry) -> Void) {
        let entry = ExpenseEntry(category: .all)
        completion(entry)
    }
    
    func getTimeline(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping (Timeline<ExpenseEntry>) -> Void) {
        let entry = ExpenseEntry(category: category(for: configuration))
        let timeLine = Timeline(entries: [entry], policy: .never)
        
        completion(timeLine)
    }
}

struct ExpenseWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "com.PiyushSinroja.ExpenseWidget", intent: MonthlyExpenseIntent.self, provider: ExpenseWidgetTimeLineProvider(), content: { entry in
            ExpenseWidgetView(category: entry.category)
        })
        .supportedFamilies([.systemLarge, .systemSmall])
        .configurationDisplayName("Configuration Expense Widget")
        .description("Expense Widget to show dynamic configuration.")
    }
}
