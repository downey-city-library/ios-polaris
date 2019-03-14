//
//  Polaris+Endpoints.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    internal enum Endpoints {
        fileprivate static let basePublic = PolarisConfiguration.shared.url.public
        fileprivate static let baseProtected = PolarisConfiguration.shared.url.protected
        
        case authenticateStaffUser
        
        internal var stringValue: String {
            switch self {
            case .authenticateStaffUser:
                return Endpoints.baseProtected + "/authenticator/staff"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}
