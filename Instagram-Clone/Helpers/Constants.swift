//
//  Constants.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/21/23.
//

import SwiftUI
import Firebase
import FirebaseStorage


//Strings
let TEXT_NEED_AN_ACCOUNT = "Don't have an account?"
let TEXT_SIGNIN_HEADLINE = "Photo Sharing"
let TEXT_SIGNIN_SUBHEADLINE = "The easiest way to share photos with your family and friends"
let TEXT_SIGN_UP = "Sign up"
let TEXT_SIGNUP_PASSWORD_FOOTNOTE = "At least 8 charaters required."
let TEXT_SIGNUP_NOTE = "An accoutn will allow you to save and access photo information across devices. You can delete your account at any time and your information will not be shared."

struct K {
    
    struct ButtonTitle {
        static let signup = "Sign up"
        static let signin = "Sign in"
        
    }
    
    struct PlaceholderText {
        static let email = "Email"
        static let password = "Password"
        static let username = "Username"
    }
    
    struct NavigationTitle {
        static let register = "Register"
    }
    
    struct ImageName {
        static let noProfileImage = "noProfileImage"
    }
    
    struct Ref {
        // Storage
        static var STORAGE_ROOT = Storage.storage().reference(forURL: "gs://ourpics-93208.appspot.com")
        static var STORAGE_AVATAR = STORAGE_ROOT.child("avatar")
        static func STORAGE_AVATAR_USERID(userId: String) -> StorageReference {
            return STORAGE_AVATAR.child(userId)
        }
        
        // Firestore
        static var FIRESTORE_ROOT = Firestore.firestore()
        static var FIRESTORE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
        static func FIRESTORE_DOCUMENT_USERID(userId: String) -> DocumentReference {
            return FIRESTORE_COLLECTION_USERS.document(userId)
        }
    }
}


