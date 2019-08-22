//
//  Patron+Name+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/20/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Name {
    // Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case first = "NameFirst"
        case last = "NameLast"
        case middle = "NameMiddle"
        case suffix = "NameSuffix"
        case title = "NameTitle"
    }
}

extension Patron.Name: Decodable {
    // Initialization
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        self._first = try data.decode(String.self, forKey: .first)
        self._last = try data.decode(String.self, forKey: .last)
        self._middle = (try? data.decode(String.self, forKey: .middle)) ?? ""
        self._suffix = (try? data.decode(String.self, forKey: .suffix)) ?? ""
        self._title = (try? data.decode(Title.self, forKey: .title)) ?? .none
    }
}
