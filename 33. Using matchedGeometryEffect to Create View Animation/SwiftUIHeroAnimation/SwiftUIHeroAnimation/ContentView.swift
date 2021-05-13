//
//  ContentView.swift
//  SwiftUIHeroAnimation
//
//  Created by Kim, Min Ho on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    
    @Namespace private var articleTransition
    
    var body: some View {
        if !showDetail {        // article view with smaller image
            VStack {
                Spacer()
                
                VStack {
                    Image("cafe-1")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .matchedGeometryEffect(id: "image", in: articleTransition)
                        .cornerRadius(10)
                        .animation(.interactiveSpring())
                        .padding()
                        .onTapGesture {
                            showDetail.toggle()
                        }
                    
                    Text("The Watertower is a full-service restaurant/cafe located in the Sweet Auburn District of Altlanta.")
                        .matchedGeometryEffect(id: "text", in: articleTransition)
                        .animation(nil)
                        .padding(.horizontal)
                }
            }
        } else {                // article view in a full screen
            ScrollView {
                VStack {
                    Image("cafe-1")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 400)
                        .clipped()
                        .matchedGeometryEffect(id: "image", in: articleTransition)
                        .animation(.interactiveSpring())
                        .onTapGesture {
                            showDetail.toggle()
                        }
                    
                    Text("The Watertower is a full-service restaurant/cafe located in the Sweet Aurburn District of Atlanta. The restaurant features a full menu of moderately priced \"comfor\" food influenced by African and French cooking traditions, but based upon time honored recipes from around the world. The cafe section of The Watertower features a coffeehouse with a dessert bar, magazines, and space for live performers.\n\nThe Watertower will be owned and operated by The Wathertower LLC, a Georgia limited liability corporation managed by David N. Patton IV, a resident of the Empowerment Zone. The members of the LLC are David N. Patton IV (80%) and the Historic District Development Corporation (20%).\n\nThis business plan offers financial institutions an oppotunity to review our vision and strategic focus. It also provides a step-by-step plan for the business start-up, establishing favorable sales numbers, gross margin, and profitability.\n\nThis plan includes chapters on the company, products and services, market focus, action plans and forecasts, management team, and financial plan.")
                        .matchedGeometryEffect(id: "text", in: articleTransition)
                        .animation(.easeOut)
                        .padding(.all, 20)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
