//
//  SigninView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct SigninView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
            VStack {
                Spacer()
                HeaderView()
                Spacer()
                Divider()
                EmailTextField(email: $email)
                PasswordTextField(password: $password)
                SigninButton(action: {
                    //Code goes here
                }, label: K.ButtonTitle.signin)
                Divider()
                NavigationLink {
                    SignupView()
                } label: {
                    SignupText()
                }
            }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}



