//
//  AuthenticateStaffUserRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal struct AuthenticateStaffUserRequest: Codable {
    let domain: String
    let username: String
    let password: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case domain = "Domain"
        case username = "Username"
        case password = "Password"
    }
}
