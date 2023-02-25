//
//  Encodable.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/24/23.
//

import Foundation

//Here we add our own funciton that takes data and returns it into a dictionary
extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dicitonary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? [String: Any] else {
            throw NSError()
        }
        return dicitonary
    }
}
