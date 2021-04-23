//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct ContentView: View {
    var landmarks = [
        Landmark(name: "Charley Rivers", image: "charleyrivers"),
        Landmark(name: "Chilkoot Trail", image: "chilkoottrail"),
        Landmark(name: "Chincoteague", image: "chincoteague"),
        Landmark(name: "Hidden Lake", image: "hiddenlake"),
        Landmark(name: "Icy Bay", image: "icybay"),
        Landmark(name: "Lake Mcdonald", image: "lakemcdonald"),
        Landmark(name: "Rainbow Lake", image: "rainbowlake"),
        Landmark(name: "Silver Salmon Creek", image: "silversalmoncreek"),
        Landmark(name: "St. Mary Lake", image: "stmarylake"),
        Landmark(name: "Twin Lake", image: "twinlake"),
        Landmark(name: "Umbagog", image: "umbagog"),
        Landmark(name: "Charley Rivers 2", image: "charleyrivers"),
        Landmark(name: "Chilkoot Trail 2", image: "chilkoottrail"),
        Landmark(name: "Chincoteague 2", image: "chincoteague"),
        Landmark(name: "Hidden Lake 2", image: "hiddenlake"),
        Landmark(name: "Icy Bay 2", image: "icybay"),
        Landmark(name: "Lake Mcdonald 2", image: "lakemcdonald"),
        Landmark(name: "Rainbow Lake 2", image: "rainbowlake"),
        Landmark(name: "Silver Salmon Creek 2", image: "silversalmoncreek"),
        Landmark(name: "St. Mary Lake 2", image: "stmarylake"),
        Landmark(name: "Twin Lake 2", image: "twinlake"),
        Landmark(name: "Umbagog 2", image: "umbagog"),
    ]
    
    var body: some View {
        List(landmarks.indices) { index in
            if (0...1).contains(index) {
                FullImageRow(landmark: self.landmarks[index])
            } else {
                BasicImageRow(landmark: self.landmarks[index])
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
