//
//  ContentView.swift
//  SwiftUIKiva
//
//  Created by Kim, Min Ho on 2021/05/02.
//

import SwiftUI

struct LoanList: View {
    @ObservedObject var loanStore = LoanStore()
    
    @State private var filterEnabled = false
    @State private var maximumLoanAmount = 10000.0
    
    var body: some View {
        NavigationView {
            if self.filterEnabled {
                LoanFilter(amount: self.$maximumLoanAmount)
                    .transition(.opacity)
            }

            List(loanStore.loans) { loan in
                LoanCell(loan: loan)
                    .padding(.vertical, 5)
            }
            .navigationTitle("Kiva Loan")
            .navigationBarItems(
                trailing: Button {
                    withAnimation {
                        self.filterEnabled.toggle()
                        self.loanStore.filterLoans(maxAmount: Int(maximumLoanAmount))
                    }
                } label: {
                    Text("Filter")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.loanStore.fetchLatestLoans()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoanList()
    }
}
