//
//  LoanCell.swift
//  SwiftUIKiva
//
//  Created by Kim, Min Ho on 2021/05/02.
//

import SwiftUI

struct LoanCell: View {
    var loan: Loan
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .bold()
                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))
                Text(loan.use)
                    .font(.system(.body, design: .rounded))
            }
            
            Spacer()
            
            VStack {
                Text("$\(loan.amount)")
                    .font(.system(.title, design: .rounded))
                    .bold()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct LoanCell_Previews: PreviewProvider {
    static var previews: some View {
        LoanCell(loan: Loan(name: "Ivan", country: "Uganda", use: "to buy a plot of land", amount: 575))
            .previewLayout(.sizeThatFits)
    }
}
