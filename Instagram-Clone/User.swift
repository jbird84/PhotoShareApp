//
//  Use.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/24/23.
//

import Foundation


struct User: Codable {
    
    var uid: String
    var email: String
    var profileImageUrl: String
    var username: String
    var bio: String
    var kerwords: [String]
    
}
