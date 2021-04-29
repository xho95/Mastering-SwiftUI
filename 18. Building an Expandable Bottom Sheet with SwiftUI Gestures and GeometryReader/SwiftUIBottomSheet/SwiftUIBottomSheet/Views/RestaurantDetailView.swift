//
//  BasicDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by Kim, Min Ho on 2021/04/29.
//

import SwiftUI

struct RestaurantDetailView: View {
    @GestureState private var dragState = DragState.inactive

    @State private var offset: CGFloat = 0.0
    
    var restaurant: Restaurant
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HandleBar()
                
                ScrollView(.vertical) {
                    TitleBar()
                    
                    HeaderView(restaurant: restaurant)
                    
                    DetailInfoView(icon: "map", info: restaurant.location)
                        .padding(.top)
                    DetailInfoView(icon: "phone", info: restaurant.phone)
                    DetailInfoView(icon: nil, info: restaurant.description)
                        .padding(.top)
                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .disabled(true)
            }
            .offset(y: geometry.size.height / 2 + self.dragState.translation.height + self.offset)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .ignoresSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating($dragState) { value, state, transaction in
                        state = .dragging(translation: value.translation)
                    }
            )
        }
    }
}

struct BasicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: restaurants[0])
            .background(Color.black.opacity(0.3))
            .ignoresSafeArea(.all)
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
    }
}

struct HeaderView: View {
    let restaurant: Restaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    
                    Spacer()
                }
                .padding()
            )
    }
}

struct DetailInfoView: View {
    let icon: String?
    let info: String
    
    var body: some View {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
