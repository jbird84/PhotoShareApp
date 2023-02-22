//
//  Modifiers.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .border(Color(red: 0, green: 0, blue: 0, opacity: 0.15), width: 1)
            .padding([.leading, .trailing, .top])
    }
}

struct SigninButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .cornerRadius(5)
            .shadow(radius: 10, x: 0, y: 10)
            .padding()
    }
}
