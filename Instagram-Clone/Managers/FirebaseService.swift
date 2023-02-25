//
//  FirebaseService.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/23/23.
//

import Firebase
import FirebaseFirestore
import Foundation
import SwiftUI
import FirebaseStorage


class FirebaseService {
    static let shared = FirebaseService()
    
    let auth = Auth.auth()
    let storageRoot = Storage.storage().reference(forURL: "gs://ourpics-93208.appspot.com")
    let metaData = StorageMetadata()
    let firestoreRoot = Firestore.firestore()
    
    func createUserInFirebase(withEmail: String, andPassword: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
            auth.createUser(withEmail: withEmail, password: andPassword) { authResult, error in
                if error != nil {
                   completion(.success(authResult))
                } else {
                    completion(.failure(error ?? UnknownError.fromCreatingUserInFirebase))
                }
            }
        }
    
    func savedata(userId: String, imageData: Data, username: String, email: String) {
        let storageAvatar = storageRoot.child("avatar")
        let storageAvatarUserId = storageAvatar.child(userId)
        let metaData = metaData
        metaData.contentType = "image/jpg"
        storageAvatarUserId.putData(imageData, metadata: metaData) { [weak self] storageMetadata, error in
            guard let this = self else { return }
            if error != nil {
                print(error?.localizedDescription ?? UnknownError.fromCreatingUserInFirebase)
                return
            }
            storageAvatarUserId.downloadURL { url, error in
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = this.auth.currentUser?.createProfileChangeRequest() {
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { error in
                            if error != nil {
                                return
                            }
                        }
                    }
                    let firestoreUsers = this.firestoreRoot.collection("users")
                    let firestoreUserId = firestoreUsers.document(userId)
                    let user = User.init(uid: userId, email: email, profileImageUrl: metaImageUrl, username: username, bio: "", kerwords: [])
                    guard let dict = try? user.toDictionary() else { return }
                    guard let decoderUser = try? User.init(fromDicitonary: dict) else { return }
                    
                    print(decoderUser)
                    firestoreUserId.setData(dict)
                }
            }
        }
    }
    
    enum UnknownError: Error {
        case fromCreatingUserInFirebase
    }
}
