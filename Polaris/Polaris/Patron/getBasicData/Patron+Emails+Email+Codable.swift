//
//  Patron+Emails+Email+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/21/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Emails.Email {
    // MARK: - Coding Keys
    fileprivate enum CodingKeys: String, CodingKey {
        case alternate = "AltEmailAddress"
        case primary = "EmailAddress"
    }
}

extension Patron.Emails.Email {
    // MARK: - Initialization
    internal init(from decoder: Decoder, forPrimary: Bool) throws {
        let container = try decoder.container(keyedBy: Patron.CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .patronData)
        
        switch forPrimary {
        case true: self._address = try data.decode(String.self, forKey: .primary)
        case false: self._address = try data.decode(String.self, forKey: .alternate)
        }
    }
}
