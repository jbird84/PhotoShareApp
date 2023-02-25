//
//  SignupView.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI

struct SignupView: View {
    
    @ObservedObject var signupViewModel = SignupViewModel()
    
    func signUp() {
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print(user.email)
            self.clean()
            // Switch to the Main App
        }) { (errorMessage) in
            print("Error: \(errorMessage)")
            self.signupViewModel.showAlert = true
            self.signupViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean() {
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    var body: some View {
        VStack {
            signupViewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .padding(.bottom, 60)
                .onTapGesture {
                    signupViewModel.showImagePicker = true
                }
            UsernameTextField(username: $signupViewModel.username)
            EmailTextField(email: $signupViewModel.email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $signupViewModel.password)
                Text(TEXT_SIGNUP_PASSWORD_FOOTNOTE)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            SignupButton(action: signUp, label: K.ButtonTitle.signup).alert(isPresented: $signupViewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("OK")))
            }
            Divider()
            Text(TEXT_SIGNUP_NOTE)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
                .lineLimit(nil)
        }
        .sheet(isPresented: $signupViewModel.showImagePicker, content: {
            ImagePicker(showImagePicker: $signupViewModel.showImagePicker, pickedImage: $signupViewModel.image, imageData: $signupViewModel.imageData)
        })
        .navigationBarTitle(K.NavigationTitle.register, displayMode: .inline)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
