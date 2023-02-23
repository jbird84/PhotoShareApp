//
//  FirebaseService.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/23/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI
import FirebaseStorage


class FirebaseService {
    static let shared = FirebaseService()
    
    static let auth = Auth.auth()
    
    static let storageRoot = Storage.storage().reference(forURL: "gs://ourpics-93208.appspot.com")
    
//    func createUserInFirebase(withEmail: String, andPassword: String, completion: @escaping (Bool) -> Void) {
//        auth.createUser(withEmail: withEmail, password: andPassword) { _ , error in
//            if error != nil {
//                completion(true)
//            } else {
//                completion(false)
//            }
//        }
//    }
}
