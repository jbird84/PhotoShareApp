//
//  SignupViewModel.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/24/23.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SignupViewModel: ObservableObject {
    
     var username: String = ""
     var email: String = ""
     var password: String = ""
    var image: Image = Image(K.ImageName.noProfileImage)
     var imageData: Data = Data()
     var errorString = ""
     @Published var showImagePicker: Bool = false
     @Published var showAlert: Bool = false

    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping(_ user: User) -> Void,  onError: @escaping(_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty && !imageData.isEmpty {
           AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields"
        }
    }
}
