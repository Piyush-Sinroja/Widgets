//
//  TodayWidget.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import WidgetKit
import SwiftUI

struct TodayWidgetEntry: TimelineEntry {
    let date: Date
}

struct TodayWidgetProvider: TimelineProvider {
    
    typealias Entry = TodayWidgetEntry
    
    func placeholder(in context: Context) -> TodayWidgetEntry {
        TodayWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (TodayWidgetEntry) -> ()) {
        completion(TodayWidgetEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [TodayWidgetEntry] = []
        let currentDate = Date()
        
        for minuteOffset in 1...5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = TodayWidgetEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct TodayWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "com.todayWidget", provider: TodayWidgetProvider()) { entry in
           TodayWidgetView(entry: entry)
        }
        .configurationDisplayName("Today Widget")
        .description("Widget to show today's date.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
