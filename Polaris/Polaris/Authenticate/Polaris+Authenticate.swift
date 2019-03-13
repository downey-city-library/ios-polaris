//
//  Polaris+Authenticate.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    public struct Authenticate {
        public static func patron() {
            print("Authenticating Patron")
        }
        
        public static func staffUser() {
            print("Authenticating Staff User")
        }
    }
}
