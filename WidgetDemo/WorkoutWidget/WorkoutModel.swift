//
//  WorkoutModel.swift
//  WidgetDemo
//
//  Created by Piyush Sinroja on 15/06/23.
//

import Foundation

struct WorkoutModel: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}
extension WorkoutModel {
    static var sample: [WorkoutModel] {
        [
            .init(day: "Mon", minutes: Int.random(in: 10...70)),
            .init(day: "Tue", minutes: Int.random(in: 10...70)),
            .init(day: "Wed", minutes: Int.random(in: 10...70)),
            .init(day: "Thu", minutes: Int.random(in: 10...70)),
            .init(day: "Fri", minutes: Int.random(in: 10...70)),
            .init(day: "Sat", minutes: Int.random(in: 10...70)),
            .init(day: "Sun", minutes: Int.random(in: 10...70))
        ]
    }
}
