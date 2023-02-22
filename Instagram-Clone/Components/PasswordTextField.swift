//
//  PasswordTextField.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct PasswordTextView: View {
    @Binding var password: String
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .foregroundColor(.gray)
            SecureField("Password", text: $password)
        }
        .modifier(TextFieldModifier())
    }
}
