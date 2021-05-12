//
//  ContentView.swift
//  SwiftUITabView
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Home Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
