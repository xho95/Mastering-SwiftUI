//
//  ContentView.swift
//  Exercise02
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()

                IconPricingView(icon: "burst.fill", title: "Basic", price: "9", textColor: .white, bgColor: .purple)
                    .padding(.horizontal, 30)
            }

            VStack {
                Spacer()
                
                IconPricingView(icon: "dial.min", title: "Pro", price: "$19", textColor: .white, bgColor: Color(red: 255/255, green: 183/255, blue: 37/255))
                    .padding(.horizontal, 40)

                Spacer()
            }

            VStack {
                IconPricingView(icon: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 50/255, green: 50/255, blue: 50/255))
                    .padding(.horizontal, 50)

                Spacer()
            }
        }
        .frame(height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct IconPricingView: View {
    var icon: String?
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            icon.map {
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
