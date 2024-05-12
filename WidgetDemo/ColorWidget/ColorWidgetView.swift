//
//  ColorWidgetView.swift
//  WidgetDemo
//
//  Created by Piyush Sinroja on 16/06/23.
//

import SwiftUI
import WidgetKit

struct ColorWidgetView: View {
    
    var entry: ColorEntry
    
    private var backColor: Color {
        switch entry.backColor {
        case .pink:
            return .pink
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .yellow:
            return .yellow
        case .red:
            return .red
        case .unknown:
            return .orange
        }
    }
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .foregroundStyle(backColor.gradient)
                .padding()
            
            Text("Color Widget")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}

struct ColorWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ColorWidgetView(entry: ColorEntry.init(backColor: .red))
        .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
