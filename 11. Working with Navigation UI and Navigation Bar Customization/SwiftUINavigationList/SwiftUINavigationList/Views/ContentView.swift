//
//  ContentView.swift
//  SwiftUINavigationList
//
//  Created by Simon Ng on 18/8/2020.
//

import SwiftUI

struct ContentView: View {
    
    var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Homei", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),
        Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetail(restaurant: restaurant)) {
                        BasicImageRow(restaurant: restaurant)
                    }
                }
            }
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    init() {
        let barAppearance = UINavigationBarAppearance()
        
        barAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 35)!
        ]
        
        barAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!
        ]
        
        barAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().compactAppearance = barAppearance
        
        UINavigationBar.appearance().tintColor = .green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

