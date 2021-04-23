//
//  BasicImageRow.swift
//  SwiftUIList
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI


struct BasicImageRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(landmark.name)
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var landmark = Landmark(name: "Charley Rivers", image: "charleyrivers")
    
    static var previews: some View {
        BasicImageRow(landmark: landmark)
    }
}
