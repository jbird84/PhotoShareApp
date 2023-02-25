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
        FirebaseService.shared.createUserInFirebase(withEmail: email, andPassword: password) { result in
            switch result {
            case .success(let authData):
                guard let userId = authData?.user.uid else { return }
                FirebaseService.shared.savedata(userId: userId, imageData: imageData, username: username, email: email)
            case .failure(let error):
                print(error.localizedDescription)
            }
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





//let storageAvatar = FirebaseService.shared.storageRoot.child("avatar")
//let storageAvatarUserId = storageAvatar.child(userId)
//let metaData = FirebaseService.shared.metaData
//metaData.contentType = "image/jpg"
//storageAvatarUserId.putData(imageData, metadata: metaData) { storageMetadata, error in
//    if error != nil {
//        print(error?.localizedDescription ?? FirebaseService.UnknownError.fromCreatingUserInFirebase)
//        return
//    }
//    storageAvatarUserId.downloadURL { url, error in
//        if let metaImageUrl = url?.absoluteString {
//            if let changeRequest = FirebaseService.shared.auth.currentUser?.createProfileChangeRequest() {
//                changeRequest.photoURL = url
//                changeRequest.displayName = username
//                changeRequest.commitChanges { error in
//                    if error != nil {
//                        return
//                    }
//                }
//            }
//            let firestoreUsers = FirebaseService.shared.firestoreRoot.collection("users")
//            let firestoreUserId = firestoreUsers.document(userId)
//            let userInfo = ["username": username, "email": email, "profileImageUrl": metaImageUrl]
//            firestoreUserId.setData(userInfo)
//        }
//    }
//}
