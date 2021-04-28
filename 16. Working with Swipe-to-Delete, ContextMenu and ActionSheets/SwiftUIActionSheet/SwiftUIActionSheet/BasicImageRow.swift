//
//  BasicImageRow.swift
//  SwiftUIActionSheet
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI


struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }

            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var restaurant = Restaurant(name: "Cafe Deadend", image: "cafedeadend")
    
    static var previews: some View {
        BasicImageRow(restaurant: restaurant)
    }
}
