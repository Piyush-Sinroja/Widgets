//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by Piyush Sinroja on 14/06/23.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        TodayWidget()
        PhotoWidget()
        PedometerWidget()
        WorkoutWidget()
        ColorWidget()
        ExpenseWidget()
    }
}
