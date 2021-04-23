//
//  ContentView.swift
//  CardTransition
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    private var cards = [
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng"),
        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos"),
        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan"),
        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Reading")
                    Text("List")
                }
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .padding(.horizontal)

                Spacer()
            }

            ForEach(0..<cards.count, id: \.self) { index in
                if index == selectedIndex {
                    cards[index]
                        .transition(
                            AnyTransition.asymmetric(
                                insertion: AnyTransition.scale(scale: 0, anchor: .bottom).combined(with: .opacity),
                                removal: AnyTransition.scale(scale: 0, anchor: .bottom).combined(with: .opacity))
                        )
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            withAnimation {
                self.selectedIndex += 1
                if self.selectedIndex == cards.count {
                    self.selectedIndex = 0
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
