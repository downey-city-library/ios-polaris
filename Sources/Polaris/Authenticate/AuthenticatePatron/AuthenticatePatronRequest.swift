//
//  AuthenticatePatronRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal struct AuthenticatePatronRequest: Codable {
    public let barcode: String
    public let password: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case password = "Password"
    }
}
