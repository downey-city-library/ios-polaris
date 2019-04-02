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
        
        // Authenticate
        case authenticatePatron
        case authenticateStaffUser
        
        // Bib
        case bibGet(Int)
        
        // Patron
        case registrationCreate
        
        internal var stringValue: String {
            switch self {
            // Authenticate
            case .authenticatePatron:
                return Endpoints.basePublic + "/authenticator/patron"
            case .authenticateStaffUser:
                return Endpoints.baseProtected + "/authenticator/staff"
                
            // Bib
            case .bibGet (let bibID):
                return Endpoints.basePublic + "/bib/\(bibID)"
            
            // Patron
            case .registrationCreate:
                return Endpoints.basePublic + "/patron"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}
