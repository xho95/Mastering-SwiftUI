//
//  ContentView.swift
//  SwiftUITinderTrip
//
//  Created by Simon Ng on 24/8/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarMenu()
            
            CardView(image: trips[0].image, title: trips[0].destination)
            
            Spacer(minLength: 20)
            
            BottomBarMenu()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            TopBarMenu()
                .previewLayout(.sizeThatFits)
                //.previewLayout(.fixed(width: 375, height: 60))
            BottomBarMenu()
                .previewLayout(.sizeThatFits)
        }
    }
}
