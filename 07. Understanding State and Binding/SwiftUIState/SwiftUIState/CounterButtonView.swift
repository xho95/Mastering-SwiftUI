//
//  CounterButtonView.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct CounterButtonView: View {
    @State private var counter = 1
    
    var body: some View {
        VStack {
            CounterButton(counter: $counter, color: .red)
            CounterButton(counter: $counter, color: .green)
            CounterButton(counter: $counter, color: .blue)
        }
    }
}

struct CounterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CounterButtonView()
    }
}
