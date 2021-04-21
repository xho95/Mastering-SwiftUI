//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)

                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    LabelView(label: "Best for designer", yOffset: 87)
                }
            }
            .padding()

            ZStack {
                PricingView(symbol: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 50/255, green: 50/255, blue: 50/255))
                
                LabelView(label: "Perfect for teams with 20 members", yOffset: 92)
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct PricingView: View {
    var symbol: String?
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            if let symbol = symbol {
                Image(systemName: symbol)
                    .font(.system(size: 40))
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
        .padding(symbol == nil ? 40 : 20)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct LabelView: View {
    var label: String
    var yOffset: CGFloat
    
    var body: some View {
        Text(label)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: yOffset)
    }
}
