//
//  WorkoutWidget.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 15/06/23.
//

import SwiftUI
import WidgetKit

struct WorkoutEntry: TimelineEntry {
    let date: Date
    let workoutData: [WorkoutModel]
    let widgetFamily: WidgetFamily
}

struct WorkoutTimelineProvider: TimelineProvider {
    
    private let workoutData = WorkoutModel.sample
    
    func placeholder(in context: Context) -> WorkoutEntry {
        WorkoutEntry(date: Date(), workoutData: workoutData, widgetFamily: context.family)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WorkoutEntry) -> Void) {
        completion(WorkoutEntry(date: Date(), workoutData: workoutData, widgetFamily: context.family))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WorkoutEntry>) -> Void) {
        let currentDate = Date()
        let workoutNew = WorkoutModel.sample
        let entry = WorkoutEntry(date: currentDate, workoutData: workoutNew, widgetFamily: context.family)
        let refreshDate = Calendar.current.date(byAdding: .second, value: 20, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            
        completion(timeline)
    }

    typealias Entry = WorkoutEntry
}

struct WorkoutWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "com.Piyush.WorkoutWidget", provider: WorkoutTimelineProvider()) { entry in
            WorkoutView(workoutData: entry.workoutData, showLineChart: entry.widgetFamily == .systemMedium)
        }
        .configurationDisplayName("Workout tracker")
        .description("Widget to display weekly workout in chart.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}
