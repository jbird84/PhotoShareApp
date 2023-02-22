//
//  PasswordTextField.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .foregroundColor(.gray)
            SecureField(K.PlaceholderText.password, text: $password)
        }
        .modifier(TextFieldModifier())
    }
}
