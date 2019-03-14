//
//  AuthenticateStaffUserRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

struct AuthenticateStaffUserRequest: Codable {
    let domain: String
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case domain = "Domain"
        case username = "Username"
        case password = "Password"
    }
}
