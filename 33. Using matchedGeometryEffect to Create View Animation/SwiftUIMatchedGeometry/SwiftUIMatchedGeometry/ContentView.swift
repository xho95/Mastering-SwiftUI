//
//  ContentView.swift
//  SwiftUIMatchedGeometry
//
//  Created by Kim, Min Ho on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    @State private var expand = false
    
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: expand ? 300 : 150, height: expand ? 300 : 150)
            .offset(y: expand ? -200 : 0)
            .animation(.default)
            .onTapGesture {
                expand.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
