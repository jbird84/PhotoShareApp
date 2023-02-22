//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HeaderView()
            Spacer()
            Divider()
            EmailTextView(email: $email)
            PasswordTextView(password: $password)
            SigninButton(action: {
                //Code goes here
            }, label: "Sign in")
            Divider()
            SignupView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



