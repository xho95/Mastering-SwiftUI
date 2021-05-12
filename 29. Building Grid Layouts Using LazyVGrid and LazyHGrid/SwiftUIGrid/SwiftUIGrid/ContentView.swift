//
//  ContentView.swift
//  SwiftUIGrid
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    private var symbols = [
        "keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"
    ]
    
    private var colors: [Color] = [.yellow, .purple, .green]

//    private var gridItemLayout = [
//        GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)
//    ]

//    private var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
    
//    private var gridItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(150))]

    private var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(0...9999, id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        //.frame(width: 50, height: 50)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
