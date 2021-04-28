//
//  UserRegistration.swift
//  SwiftUIRegistration
//
//  Created by Kim, Min Ho on 2021/04/27.
//

import Foundation
import Combine

class UserRegistration: ObservableObject {
    // Inputs
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    // Outputs
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map { $0.count >= 4 }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)         // to prevent a memory leak by storing a cancellable reference
        
        $password
            .receive(on: RunLoop.main)
            .map { $0.count >= 8 }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { $0.range(of: "[A-Z]", options: .regularExpression) != nil ? true : false }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { $0 == $1 && !$1.isEmpty }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)
    }
}
