//
//  Polaris+Authenticate+StaffRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Authenticate {
    
    struct StaffRequest: Encodable {
        
        // MARK: - Properties
        public private(set) var domain: String
        public private(set) var username: String
        public private(set) var password: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case domain = "Domain"
            case username = "Username"
            case password = "Password"
        }
    }
}
