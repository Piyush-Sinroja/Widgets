//
//  WorkoutView.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 15/06/23.
//

import SwiftUI
import Charts
import WidgetKit

struct WorkoutView: View {
    
    var workoutData = WorkoutModel.sample
    
    var showLineChart = true
    
    var body: some View {
        VStack {
            Text("Workout Tracker")
                .font(.subheadline)
            
            Chart(workoutData) { workout in
                if showLineChart {
                    AreaMark(x: .value("Day", workout.day), y: .value("Mins", workout.minutes))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(Gradient(colors: [.blue.opacity(0.3), .clear]))
                    
                    LineMark(x: .value("Day", workout.day), y: .value("Mins", workout.minutes))
                        .interpolationMethod(.catmullRom)
                    
                    PointMark(x: .value("Day", workout.day), y: .value("Mins", workout.minutes))
                        .annotation(position: .leading) {
                            Text(workout.minutes.formatted())
                                .font(.caption2)
                        }
                } else {
                    BarMark(x: .value("Day", workout.day), y: .value("Mins", workout.minutes))
                        .foregroundStyle(by: .value("Day", workout.day))
                        .annotation {
                            Text("\(workout.minutes) mins")
                                .font(.caption2)
                        }
                }
            }
        }
        .padding()
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
       
        WorkoutView(showLineChart: false)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            
    }
}
