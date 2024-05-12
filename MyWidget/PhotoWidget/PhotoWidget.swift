//
//  PhotoWidget.swift
//  PhotoWidget
//
//  Created by Piyush Sinroja on 19/06/23.
//

import WidgetKit
import SwiftUI

struct PhotoWidgetEntry: TimelineEntry {
    let date: Date
    let imgUrl: String
}

struct PhotoWidgetProvider: TimelineProvider {
    
    typealias Entry = PhotoWidgetEntry
    
    private let imgUrl = "https://source.unsplash.com/random/?nature"
    
    func placeholder(in context: Context) -> PhotoWidgetEntry {
        PhotoWidgetEntry(date: Date(), imgUrl: imgUrl)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PhotoWidgetEntry) -> Void) {
        completion(PhotoWidgetEntry(date: Date(), imgUrl: "https://source.unsplash.com/random/?flower"))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<PhotoWidgetEntry>) -> Void) {
        let currentDate = Date()
        let entry = PhotoWidgetEntry(date: currentDate, imgUrl: imgUrl)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct PhotoWidget: Widget {
    
    let kind: String = "PhotoWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PhotoWidgetProvider()) { entry in
            PhotoWidgetView(entry: entry)
        }
        .configurationDisplayName("Photo Widget")
        .description("Photo widget description")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
    }
}
