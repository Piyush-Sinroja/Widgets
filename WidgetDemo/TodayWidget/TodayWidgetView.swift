//
//  TodayWidgetView.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import SwiftUI
import WidgetKit

struct TodayWidgetView: View {
    
    let entry: TodayWidgetEntry
    
    var body: some View {
        VStack(spacing: 10) {
            Text(entry.date, format: .dateTime.month(.abbreviated))
                .font(.title)
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color.red.gradient)
            
            Text(entry.date, format: .dateTime.day())
                .font(.largeTitle)
            
            Text(entry.date, style: .time)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .widgetBackground(background(Color.white.gradient, in: ContainerRelativeShape()))
        .shadow(radius: 2)
    }
}

struct TodayWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWidgetView(entry: TodayWidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return backgroundView
        }
    }
}
