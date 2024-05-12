//
//  PedometerView.swift
//  WidgetExample
//
//  Created by Piyush Sinroja on 14/06/23.
//

import SwiftUI

struct PedometerView: View {
    
    @AppStorage(PedometerAppConstant.stepsStorageKey, store: UserDefaults(suiteName: PedometerAppConstant.appGroupName))
    
    private var stepsStorage: Int = 0
    
    @StateObject private var manager = PedometerManager()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.orange.gradient)
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.gray.gradient.opacity(0.5))
                .frame(width: 250, height: 100)
            
            Text("\(manager.pedometer.steps) Steps")
                .font(.system(size: 44))
                .foregroundColor(.white)
        }
        .onAppear {
            manager.refreshData()
        }
        .onReceive(manager.objectWillChange) { _ in
            stepsStorage = manager.pedometer.steps
            PedometerAppConstant.reloadPedometerTimelines()
            print(stepsStorage)
        }
    }
}

struct PedometerView_Previews: PreviewProvider {
    static var previews: some View {
        PedometerView()
    }
}
