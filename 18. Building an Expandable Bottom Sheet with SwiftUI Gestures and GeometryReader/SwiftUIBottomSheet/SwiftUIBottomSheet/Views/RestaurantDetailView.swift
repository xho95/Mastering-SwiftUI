//
//  BasicDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by Kim, Min Ho on 2021/04/29.
//

import SwiftUI

enum ViewState {
    case full, half
}

struct RestaurantDetailView: View {
    var restaurant: Restaurant

    @GestureState private var dragState = DragState.inactive

    @State private var viewState = ViewState.half
    @State private var offset: CGFloat = 0.0
    @State private var scroll: CGFloat = 0.0

    @Binding var isShow: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HandleBar()
                
                ScrollView(.vertical) {
                    GeometryReader { scrollViewProxy in
                        Color.clear.preference(key: ScrollOffsetKey.self,
                                               value: scrollViewProxy.frame(in: .named("scrollview")).minY)
                        //Text("\(scrollViewProxy.frame(in: .named("scrollview")).minY)")
                    }
                    .frame(height: 0)
                    
                    VStack {
                        TitleBar()
                        
                        HeaderView(restaurant: restaurant)
                        
                        DetailInfoView(icon: "map", info: restaurant.location)
                            .padding(.top)
                        DetailInfoView(icon: "phone", info: restaurant.phone)
                        DetailInfoView(icon: nil, info: restaurant.description)
                            .padding(.top)
                            .padding(.bottom, 100)
                    }
                    .offset(y: -self.scroll)
                    .animation(nil)
                }
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .disabled(self.viewState == .half)
                .coordinateSpace(name: "scrollview")
            }
            .offset(y: geometry.size.height / 2 + self.dragState.translation.height + self.offset)
            .offset(y: self.scroll)
            .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            .ignoresSafeArea(.all)
            .gesture(
                DragGesture()
                    .updating($dragState) { value, state, transaction in
                        state = .dragging(translation: value.translation)
                    }
                    .onEnded { value in
                        if self.viewState == .half {
                            // Threshold #1: fully opened
                            if value.translation.height < -geometry.size.height * 0.25 {
                                print("hi")
                                self.offset = -geometry.size.height / 2 + 50
                                self.viewState = .full
                            }
                            
                            // Threshold #2: dismiss
                            if value.translation.height > geometry.size.height * 0.3 {
                                print("low")
                                self.isShow = false
                            }
                        }
                    }
            )
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                //print("\(value)")
                if self.viewState == .full {
                    self.scroll = value > 0 ? value : 0
                    
                    if self.scroll > 120 {
                        self.offset = 0
                        self.viewState = .half
                        self.scroll = 0
                    }
                }
            }
            //.offset(y: self.scroll)
        }
    }
}

struct BasicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: restaurants[0], isShow: .constant(true))
            .background(Color.black.opacity(0.3))
            .ignoresSafeArea(.all)
    }
}

// PreferenceKey allows you to pass data from child views to its ancestors
struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout Value, nextValue: () -> CGFloat) {
        value += nextValue()
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
