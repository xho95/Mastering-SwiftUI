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
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Discover")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Explore your next destination")
                    .font(.system(.headline, design: .rounded))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 25)
            .padding(.leading, 20)
            .opacity(isCardTapped ? 0.1 : 1.0)
            .offset(y: isCardTapped ? -100 : 0)
            
            GeometryReader { outer in
                HStack(spacing: 0) {
                    ForEach(sampleTrips.indices) { index in
                        GeometryReader { inner in
                            TripCardView(destination: sampleTrips[index].destination,
                                         imageName: sampleTrips[index].image,
                                     isShowDetails: $isCardTapped)
                        }
                        .padding(.horizontal, self.isCardTapped ? CGFloat(0) : 20)
                        .opacity(currentTripIndex == index ? 1.0 : 0.7)
                        .frame(width: outer.size.width, height: currentTripIndex == index ? (isCardTapped ? outer.size.height : 450) : 400)
                    }
                }
                .frame(width: outer.size.width, height: outer.size.height, alignment: .leading)
                .offset(x: -CGFloat(currentTripIndex) * outer.size.width)
                .offset(x: dragOffset)
                .gesture(
                    !isCardTapped ? DragGesture()
                        .updating($dragOffset) { value, state, transaction in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let threshold = outer.size.width * 0.65
                            var newIndex = Int(-value.translation.width / threshold) + currentTripIndex
                            newIndex = min(max(newIndex, 0), sampleTrips.count - 1)
                            currentTripIndex = newIndex
                        }
                        : nil
                )
            }
            .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
