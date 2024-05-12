//
//  PedometerAppConstant.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import WidgetKit
import SwiftUI

struct PedometerAppConstant {
    static var stepsStorageKey = "totalSteps"
    static var appGroupName = "group.com.pedometer"
    
    static var widgetKind = "com.pedometerWidget"
    static func reloadPedometerTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: self.widgetKind)
    }
}
