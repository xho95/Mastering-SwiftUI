//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct ContentView: View {
    var landmarkNames = ["Charley Rivers", "Chilkoot Trail", "Chincoteague", "Hidden Lake", "Icy Bay", "Lake Mcdonald", "Rainbow Lake", "Silver Salmon Creek", "St. Mary Lake", "Twin Lake", "Umbagog"]
    
    var landmarkImages = ["charleyrivers", "chilkoottrail", "chincoteague", "hiddenlake", "icybay", "lakemcdonald", "rainbowlake", "silversalmoncreek", "stmarylake", "twinlake", "umbagog"]
    
    var body: some View {
        List(landmarkNames.indices, id: \.self) { index in
            HStack {
                Image(self.landmarkImages[index])
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
                Text(self.landmarkNames[index])
            }
        }
        
        /*
        List {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
            Text("Item 4")
        }
    
        List {
            ForEach(1...4, id: \.self) { index in
                Text("Item \(index)")
            }
        }

        List {
            ForEach(1...4, id: \.self) {
                Text("Item \($0)")
            }
        }
         
         List(1...4, id: \.self) {
             Text("Item \($0)")
         }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
