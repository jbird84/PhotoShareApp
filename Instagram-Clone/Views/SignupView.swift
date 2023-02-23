//
//  SignupView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct SignupView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showImagePicker = false
    @State private var image = Image("noProfileImage")
    @State var imageData: Data = Data()
    
    func signUp() {
        FirebaseService.auth.createUser(withEmail: email, password: password) { authData, error in
            if error != nil {
                return
            }
            let storageAvatar = FirebaseService.storageRoot.child("avatar")
            let storageAvatarUserId = storageAvatar.child(<#T##path: String##String#>)
        }
    }
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .padding(.bottom, 60)
                .onTapGesture {
                    showImagePicker = true
                }
            UsernameTextField(username: $username)
            EmailTextField(email: $email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $password)
                Text(TEXT_SIGNUP_PASSWORD_FOOTNOTE)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            SigninButton(action: {
                signUp()
            }, label: K.ButtonTitle.signup)
            Divider()
            Text(TEXT_SIGNUP_NOTE)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
                .lineLimit(nil)
        }
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(showImagePicker: $showImagePicker, pickedImage: $image, imageData: $imageData)
        })
        .navigationBarTitle(K.NavigationTitle.register, displayMode: .inline)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
