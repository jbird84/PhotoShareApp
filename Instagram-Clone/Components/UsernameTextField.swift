//
//  UsernameTextField.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(.gray)
            TextField(K.PlaceholderText.username, text: $username)
        }
        .modifier(TextFieldModifier())
    }
}

struct UsernameTextField_Previews: PreviewProvider {
    static var previews: some View {
        UsernameTextField(username: .constant("Josh K."))
    }
}
