//
//  ColorWidget.swift
//  WidgetDemo
//
//  Created by Piyush Sinroja on 16/06/23.
//
import SwiftUI
import WidgetKit

struct ColorEntry: TimelineEntry {
    let date = Date()
    let backColor: ColorSelection
}

struct ColorWidgetTimeLineProvider: IntentTimelineProvider {
    typealias Entry = ColorEntry
    typealias Intent = ColorSelectionIntentIntent
    
    func placeholder(in context: Context) -> ColorEntry {
        ColorEntry(backColor: .orange)
    }
    
    func getSnapshot(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping (ColorEntry) -> Void) {
        let entry = ColorEntry(backColor: .orange)
        completion(entry)
    }
    
    func getTimeline(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping (Timeline<ColorEntry>) -> Void) {
        let entry = ColorEntry(backColor: configuration.backColor)
        let timeLine = Timeline(entries: [entry], policy: .never)
        
        completion(timeLine)
    }
}
struct ColorWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: "com.PiyushSinroja.ColorWidget", intent: ColorSelectionIntentIntent.self, provider: ColorWidgetTimeLineProvider(), content: { entry in
            ColorWidgetView(entry: entry)
        })
        .supportedFamilies([.systemLarge, .systemMedium])
        .configurationDisplayName("Configuration Color Widget")
        .description("Widget to show dynamic configuration.")
    }
}
