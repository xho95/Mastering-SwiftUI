//
//  BlankView.swift
//  SwiftUIBottomSheet
//
//  Created by Kim, Min Ho on 2021/04/29.
//

import SwiftUI

struct BlankView: View {
    var background: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(background)
        .ignoresSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(background: .white)
    }
}
