//
//  UserRegistration.swift
//  SwiftUIRegistration
//
//  Created by Kim, Min Ho on 2021/04/27.
//

import Foundation

class UserRegistration: ObservableObject {
    // Inputs
    @Published var username = ""
    @Published var password = ""
    @Published var usernameConfirm = ""
    
    // Outputs
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLenghtValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
}
