//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        Text("Stay Hungry. Stay Foolish.")
            .fontWeight(.bold)
                //.font(.system(.title, design: .rounded))      // depending on the user's preference
                //.font(.system(size: 20))                      // fixed
                //.font(.custom("Helvetica Neue", size: 25))
            .foregroundColor(.green)
         */
        
        Text("your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma-which is living with the results of other people's thinking. Don't let the noise of others' opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
                //.lineLimit(3)
            .lineLimit(nil)
            .truncationMode(.head)
            .lineSpacing(10)
            .padding()
                //.rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))    // anchor : the center of rotation
            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 2, x: 0, y: 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
