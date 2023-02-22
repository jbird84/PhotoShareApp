//
//  EmailTextField.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        HStack {
            Image(systemName: "envelope.fill")
                .foregroundColor(.gray)
            TextField(K.PlaceholderText.email, text: $email)
        }
        .modifier(TextFieldModifier())
    }
}
