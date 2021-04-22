//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    
    var body: some View {
        Button {
            self.isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
