//
//  LoanStore.swift
//  SwiftUIKiva
//
//  Created by Kim, Min Ho on 2021/05/02.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    @Published var loans = [Loan]()
    
    private static var kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    private var cachedLoans = [Loan]()

    enum CodingKeys: CodingKey {
        case loans
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loan].self, forKey: .loans)
    }
    
    init() {
        
    }
    
    func fetchLatestLoans() {
        guard let loanURL = URL(string: Self.kivaLoanURL) else { return }
        
        let request = URLRequest(url: loanURL)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            
            // parse JSON data
            if let data = data {
                DispatchQueue.main.async {
                    self.loans = self.parseJSONData(data: data)
                    self.cachedLoans = self.loans
                }
            }
        }
        
        task.resume()
    }
    
    func parseJSONData(data: Data) -> [Loan] {
        let decoder = JSONDecoder()
        
        do {
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
        } catch {
            print(error)
        }
        
        return loans
    }
    
    func filterLoans(maxAmount: Int) {
        self.loans = self.cachedLoans.filter { $0.amount < maxAmount }
    }
}


