//
//  ContentView.swift
//  SwiftUIGridViewAnimation
//
//  Created by Simon Ng on 25/9/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var photoSet = samplePhotos
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
