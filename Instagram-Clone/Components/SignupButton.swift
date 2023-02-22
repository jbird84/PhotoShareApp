//
//  SignupButton.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct SignupButton: View {
    var action: () -> Void
    var label: String
    var body: some View {
       Button(action: action) {
            HStack {
                Spacer()
                Text(label)
                    .foregroundColor(.pink)
                Spacer()
            }
        }
        .modifier(SigninButtonModifier())
    }
}
