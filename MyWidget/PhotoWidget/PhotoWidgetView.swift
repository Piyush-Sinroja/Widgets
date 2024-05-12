//
//  PhotoWidgetView.swift
//  PhotoWidgetExtension
//
//  Created by Piyush Sinroja on 20/06/23.
//

import SwiftUI
import WidgetKit

struct PhotoWidgetView: View {
    
    var entry: PhotoWidgetEntry
    
    var body: some View {
        let path = entry.imgUrl
          ZStack {
              GeometryReader { geometry in
                  NetworkImageView(url: URL(string: path)!)
                  .scaledToFill()
                  
                  Text("\(Int(geometry.size.width)) x \(Int(geometry.size.height))")
                      .font(.headline)
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
              }
          }
    }
}

struct NetworkImageView: View {
    
    let url: URL
    
    var body: some View {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "person")
        }
    }
    
}

struct PhotoWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let entry = PhotoWidgetEntry(date: Date(), imgUrl: "https://source.unsplash.com/random/?flowers")
        PhotoWidgetView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
