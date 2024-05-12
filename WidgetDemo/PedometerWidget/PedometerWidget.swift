//
//  PedometerWidget.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 14/06/23.
//

import SwiftUI
import WidgetKit

struct PedometerEntry: TimelineEntry {
    let date = Date()
    let steps: Int
}

struct PedometerTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> PedometerEntry {
        PedometerEntry(steps: 200)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PedometerEntry) -> Void) {
        completion(PedometerEntry(steps: 201))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PedometerEntry>) -> Void) {
        let defaults = UserDefaults(suiteName: PedometerAppConstant.appGroupName)
        let steps = defaults?.integer(forKey: PedometerAppConstant.stepsStorageKey) ?? 0
        let timeline = Timeline(entries: [PedometerEntry(steps: steps)], policy: .never)
        completion(timeline)
    }
    
    typealias Entry = PedometerEntry

}

struct PedometerWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: PedometerAppConstant.widgetKind, provider: PedometerTimelineProvider()) { entry in
         PedometerEntryView(entry: entry)
        }
        .configurationDisplayName("Lock Screen Widget")
        .description("Widget to show on lock screen")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
    }
}
