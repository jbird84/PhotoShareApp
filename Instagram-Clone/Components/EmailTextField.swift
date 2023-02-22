//
//  EmailTextField.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct EmailTextView: View {
    @Binding var email: String
    var body: some View {
        HStack {
            Image(systemName: "envelope.fill")
                .foregroundColor(.gray)
            TextField("Email", text: $email)
        }
        .modifier(TextFieldModifier())
    }
}
