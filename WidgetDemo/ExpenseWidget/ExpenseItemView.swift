//
//  ExpenseItemView.swift
//  MyWidgetExtension
//
//  Created by Piyush Sinroja on 16/06/23.
//

import SwiftUI
import WidgetKit
struct ExpenseItemView: View {
    
    var label: String
    var amount: Double
    var budget: Double
    var color: Color
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(color.gradient.opacity(0.6))
            
            VStack {
                Text(label)
                    .bold()
                
                Spacer(minLength: 0)
                
                Gauge(value: amount, in: 0...budget) {
                    Text(label.split(separator: " ")[0])
                        .font(.caption)
                } currentValueLabel: {
                    Text("\(budget, specifier: "$%.0f")")
                        .font(.footnote)
                }
                
                .scaleEffect(2.0)
                .gaugeStyle(.accessoryCircular)
                .tint(color.gradient)
                .shadow(radius: 1)
                
                Spacer(minLength: 0)
            }
            .foregroundColor(.white)
            .padding(5)
        }
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(label: "Total Expense", amount: 5000, budget: 7000, color: .mint)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
