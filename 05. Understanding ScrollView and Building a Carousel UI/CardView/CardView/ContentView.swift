//
//  ContentView.swift
//  CardView
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("kf-21")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text("Fighter")
                    .font(.headline)
                Text("KF-21 from South Korea")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text("made by KAI")
                    .font(.subheadline)
            }
            .padding()
        }
        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
        .cornerRadius(15)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

