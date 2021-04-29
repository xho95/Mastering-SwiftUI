//
//  ContentView.swift
//  SwiftUIMagnification
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MagnifiableView {
            Image(systemName: "swift")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
