//
//  PhotoWidget.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import WidgetKit
import SwiftUI

struct PhotoWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "com.photoWidget", provider: PhotoWidgetProvider()) { entry in
            PhotoWidgetView(entry: entry)
        }
        .configurationDisplayName("Photo Widget")
        .description("Photo widget description")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


struct PhotoWidgetEntry: TimelineEntry {
    let date: Date
    let imgUrl: String
}

struct PhotoWidgetProvider: TimelineProvider {
    
    private let imgUrl = "https://source.unsplash.com/random/?nature"
    
    func placeholder(in context: Context) -> PhotoWidgetEntry {
        PhotoWidgetEntry(date: Date(), imgUrl: imgUrl)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PhotoWidgetEntry) -> Void) {
        completion(PhotoWidgetEntry(date: Date(), imgUrl: imgUrl))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PhotoWidgetEntry>) -> Void) {
        let currentDate = Date()
        let entry = PhotoWidgetEntry(date: currentDate, imgUrl: "https://source.unsplash.com/random/?nature")
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

