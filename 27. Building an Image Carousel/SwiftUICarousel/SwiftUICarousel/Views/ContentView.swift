//
//  ContentView.swift
//  SwiftUICarousel
//
//  Created by Simon Ng on 27/8/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isCardTapped = false
    
    var body: some View {
        GeometryReader { outer in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(sampleTrips.indices) { index in
                        GeometryReader { inner in
                            TripCardView(destination: sampleTrips[index].destination,
                                         imageName: sampleTrips[index].image,
                                         isShowDetails: $isCardTapped)
                        }
                        .padding(.horizontal, 20)
                        .frame(width: outer.size.width, height: 450)
                    }
                }
            }
            .frame(width: outer.size.width, height: outer.size.height, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
