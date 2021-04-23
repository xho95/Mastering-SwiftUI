//
//  FullImageRow.swift
//  SwiftUIList
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct FullImageRow: View {
    var landmark: Landmark
    
    var body: some View {
        ZStack {
            Image(landmark.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(landmark.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct FullImageRow_Previews: PreviewProvider {
    static var landmark = Landmark(name: "Charley Rivers", image: "charleyrivers")

    static var previews: some View {
        FullImageRow(landmark: landmark)
    }
}
