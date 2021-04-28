//
//  ContentView.swift
//  SwiftUIActionSheet
//
//  Created by Simon Ng on 21/8/2020.
//

import SwiftUI

struct ContentView: View {
    @State var restaurants = [
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
    
    @State private var selectedRestaurant: Restaurant?
    //@State private var showActionSheet = false
    
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in        // .onDelete only works with 'ForEach', not 'List'.
                BasicImageRow(restaurant: restaurant)
                    .contextMenu {
                        Button {
                            withAnimation {
                                self.delete(item: restaurant)
                            }
                        } label: {
                            HStack {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                        
                        Button {
                            withAnimation {
                                self.setFavorite(item: restaurant)
                            }
                        } label: {
                            HStack {
                                Text("Favorite")
                                Image(systemName: "star")
                            }
                        }
                    }
                    .onTapGesture {
                        //self.showActionSheet.toggle()
                        self.selectedRestaurant = restaurant
                    }
                    .actionSheet(item: self.$selectedRestaurant) { restaurant in
                        ActionSheet(
                            title: Text("What do you want to do"),
                            message: nil,
                            buttons: [
                                .default(Text("Mark as Favorite")) {
                                    self.setFavorite(item: restaurant)
                                },
                                .destructive(Text("Delete")) {
                                    self.delete(item: restaurant)
                                },
                                .cancel()
                            ]
                        )
                    }

                    /*
                    .actionSheet(isPresented: self.$showActionSheet) {
                        ActionSheet(
                            title: Text("What do you want to do"),
                            message: nil,
                            buttons: [
                                .default(Text("Mark as Favorite")) {
                                    if let selectedRestaurant = self.selectedRestaurant {
                                        self.setFavorite(item: selectedRestaurant)
                                    }
                                },
                                .destructive(Text("Delete")) {
                                    if let selectedRestaurant = self.selectedRestaurant {
                                        self.delete(item: selectedRestaurant)
                                    }
                                },
                                .cancel()
                            ]
                        )
                    }
                    */
            }
            .onDelete { indexSet in
                self.restaurants.remove(atOffsets: indexSet)
            }
        }
    }
    
    private func delete(item restaurant: Restaurant) {      // animation is a little bit ackward
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
