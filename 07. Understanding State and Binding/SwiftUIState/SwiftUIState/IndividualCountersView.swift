//
//  IndividualCountersView.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct IndividualCountersView: View {
    @State private var totalCounter = 0
    
    var body: some View {
        VStack {
            Text("\(totalCounter)")
                .font(.system(size: 200, weight: .bold, design: .rounded))
            HStack {
                IndividualCounterButton(totalCounter: $totalCounter, color: .blue)
                IndividualCounterButton(totalCounter: $totalCounter, color: .green)
                IndividualCounterButton(totalCounter: $totalCounter, color: .red)
            }
        }
    }
}

struct IndividualCountersView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualCountersView()
    }
}
