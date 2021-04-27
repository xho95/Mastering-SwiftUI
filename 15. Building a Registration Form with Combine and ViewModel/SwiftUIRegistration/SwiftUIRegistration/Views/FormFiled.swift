//
//  FormFiled.swift
//  SwiftUIRegistration
//
//  Created by Kim, Min Ho on 2021/04/27.
//

import SwiftUI

struct FormField: View {
    var name = ""

    @Binding var text: String
    
    var isSecure = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(name, text: $text)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
            } else {
                TextField(name, text: $text)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(text: .constant(""))
    }
}
