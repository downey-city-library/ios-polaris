//
//  AuthenticatePatronRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Authenticate {
 
    struct PatronRequest: Encodable {
        
        // MARK: - Properties
        public private(set) var barcode: String
        public private(set) var password: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case barcode = "Barcode"
            case password = "Password"
        }
    }
}
