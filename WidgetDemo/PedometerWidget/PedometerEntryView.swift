//
//  PedometerEntryView.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 14/06/23.
//

import SwiftUI
import WidgetKit

struct PedometerEntryView: View {
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: PedometerEntry
    
    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            ZStack {
                Circle().stroke(lineWidth: 4)
                VStack {
                    Image(systemName: "figure.walk")
                    Text("\(entry.steps)")
                }
            }
        default:
            VStack {
                Text("\(entry.steps) steps")
            }
        
        }
        
//        switch widgetFamily {
//        case .systemSmall:
//            <#code#>
//        case .systemMedium:
//            <#code#>
//        case .systemLarge:
//            <#code#>
//        case .systemExtraLarge:
//            <#code#>
//        case .accessoryCorner:
//            <#code#>
//        case .accessoryCircular:
//            <#code#>
//        case .accessoryRectangular:
//            <#code#>
//        case .accessoryInline:
//            <#code#>
//        }
    }
}

struct PedometerEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PedometerEntryView(entry: PedometerEntry(steps: 101))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
