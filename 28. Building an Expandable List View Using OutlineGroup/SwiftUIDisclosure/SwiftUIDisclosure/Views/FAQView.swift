//
//  FAQView.swift
//  SwiftUIDisclosure
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct FAQView: View {
    @Binding var showContent: Bool
    
    var label: String
    var content: String
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $showContent,
            content: {
                Text(content)
                    .font(.body)
                    .fontWeight(.light)
            },
            label: {
                Text(label)
                    .font(.body)
                    .bold()
            }
        )
        .padding()
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView(showContent: .constant(false), label: "label", content: "content")
    }
}
