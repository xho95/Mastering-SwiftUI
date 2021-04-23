//
//  RestaurantDetail.swift
//  SwiftUINavigationList
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct RestaurantDetail: View {
    @Environment(\.presentationMode) var mode
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button {
                self.mode.wrappedValue.dismiss()
            } label: {
                Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                    .foregroundColor(.red)
            }
        )
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    static var restaurant = Restaurant(name: "Cafe Deadend", image: "cafedeadend")

    static var previews: some View {
        RestaurantDetail(restaurant: restaurant)
    }
}
