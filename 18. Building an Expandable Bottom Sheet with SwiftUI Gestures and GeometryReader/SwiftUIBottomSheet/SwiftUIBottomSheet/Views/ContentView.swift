//
//  ContentView.swift
//  SwiftUIBottomSheet
//
//  Created by Simon Ng on 1/9/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                }
            }
            .navigationBarTitle("Restaurants")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

