//
//  RegistrationCreateResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 3/29/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct RegistrationCreateResponse: Codable {
    public let barcode: String
    public let patronID: Int
    
    fileprivate enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case patronID = "PatronID"
    }
}
