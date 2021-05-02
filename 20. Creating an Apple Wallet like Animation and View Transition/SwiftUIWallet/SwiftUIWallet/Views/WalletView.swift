//
//  WalletView.swift
//  SwiftUIWallet
//
//  Created by Simon Ng on 27/8/2020.
//

import SwiftUI

struct WalletView: View {
    @State var isPresented = false
    @State var isCardPressed = false
    @State var selectedCard: Card?

    private static let cardOffset: CGFloat = 50.0
    
    var cards: [Card] = testCards

    var body: some View {
        VStack {
            TopBar()
                .padding(.bottom)
            
            Spacer()
            
            ZStack {
                if self.isPresented {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .offset(offset(for: card))
                            .animation(.default)
                            .scaleEffect(1.0)
                            .padding(.horizontal, 35)
                            .zIndex(zIndex(for: card))
                            .transition(.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(transitionAnimation(for: card))
                            .gesture(
                                TapGesture()
                                    .onEnded { _ in
                                        withAnimation {
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    }
                            )
                    }
                }
            }
            .onAppear {
                self.isPresented.toggle()
            }
            
            Spacer()
            
            if self.isCardPressed {
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.easeOut(duration: 0.15).delay(0.1))
            }
        }
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else { return 0.0 }
        
        return -Double(cardIndex)
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else { return CGSize() }
        
        if self.isCardPressed {
            guard let selectedCard = self.selectedCard, let selectedCardIndex = index(for: selectedCard) else {
                return .zero
            }
            
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            
            let offset = CGSize(width: 0, height: 1400)
            
            return offset
        } else {
            return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
        }
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return nil }
        
        return index
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        var delay = 0.0
        
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}
