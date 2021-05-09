//
//  ContentView.swift
//  SwiftUICarousel
//
//  Created by Simon Ng on 27/8/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isCardTapped = false
    @State private var currentTripIndex = 2
    
    var body: some View {
        GeometryReader { outer in
            HStack(spacing: 0) {
                ForEach(sampleTrips.indices) { index in
                    GeometryReader { inner in
                        TripCardView(destination: sampleTrips[index].destination,
                                     imageName: sampleTrips[index].image,
                                 isShowDetails: $isCardTapped)
                    }
                    .padding(.horizontal, self.isCardTapped ? CGFloat(0) : 20)
                    .frame(width: outer.size.width, height: 500)
                }
            }
            .frame(width: outer.size.width, height: outer.size.height, alignment: .leading)
            .offset(x: -CGFloat(currentTripIndex) * outer.size.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
