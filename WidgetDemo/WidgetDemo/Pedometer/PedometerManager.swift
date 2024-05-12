//
//  PedometerManager.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import CoreMotion
import SwiftUI

final class PedometerManager: ObservableObject {
    @Published var pedometer = Pedometer(steps: 0)
    
    private let cmPedometer: CMPedometer = CMPedometer()
    private var isPedometerAvailable: Bool {
        CMPedometer.isPedometerEventTrackingAvailable() &&
        CMPedometer.isDistanceAvailable() &&
        CMPedometer.isStepCountingAvailable()
    }
    
    private func getData() {
        if isPedometerAvailable {
            guard let startData = Calendar.current.date(byAdding: .hour, value: -24, to: Date()) else {
                return
            }
            cmPedometer.queryPedometerData(from: startData, to: Date()) {[weak self] data, error in
                guard let self = self,
                      let data = data,
                      error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.pedometer.steps = data.numberOfSteps.intValue
                }
            }
        }
    }
    
    init() {
        getData()
    }
    
    func refreshData() {
        getData()
    }
}
