//
//  MultiGridView.swift
//  SwiftUIPhoto
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct MultiGridView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?

    @State private var isCoffeeShown = false
    @State private var isTwoColumns = false

    @State private var gridLayout = [ GridItem() ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        if isCoffeeShown {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                                ForEach(cafe.coffeePhotos) { photo in
                                    Image(photo.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 50)
                                        .cornerRadius(10)
                                }
                            }
                            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                            .animation(.easeIn)
                        }
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring())
            }
            .navigationTitle("Coffe Feed")
            .navigationBarItems(
                trailing: HStack {
                    Button {
                        isCoffeeShown.toggle()
                    } label: {
                        Image(systemName: "squares.below.rectangle")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                        if gridLayout.count == 1 {
                            let minWidth: CGFloat = {
                                switch (horizontalSizeClass, verticalSizeClass) {
                                case (_, .compact): // iPhone Landscape
                                    return 250
                                case (.regular, .regular): // iPad
                                    return 500
                                default:
                                    return 100
                                }
                            }()

                            gridLayout = [ GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible()) ]
                        } else {
                            gridLayout = [ GridItem() ]
                        }
                    } label: {
                        Image(systemName: "rectangle.grid.3x2")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            )
        }
        .onChange(of: verticalSizeClass) { value in
            gridLayout = [
                GridItem(.adaptive(minimum: value == .compact ? 250 : 100)),
                GridItem(.flexible())
            ]
        }
        .onAppear {
            switch (horizontalSizeClass, verticalSizeClass) {
            case (.compact, .regular):  // iPhone Portrait
                gridLayout =  [ GridItem() ]
            case (_, .compact): // iPhone Landscape
                gridLayout = [ GridItem(.adaptive(minimum: 250.0)), GridItem(.flexible()) ]
            case (.regular, .regular): // iPad
                gridLayout = [ GridItem(.adaptive(minimum: 500.0)), GridItem(.flexible()) ]
            default: break
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MultiGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGridView()
    }
}
