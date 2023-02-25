//
//  Decodable+Ext.swift
//  Instagram-Clone
//
//  Created by Kinney Kare on 2/24/23.
//

import Foundation

extension Decodable {
    init(fromDicitonary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDicitonary, options: JSONSerialization.WritingOptions.prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
