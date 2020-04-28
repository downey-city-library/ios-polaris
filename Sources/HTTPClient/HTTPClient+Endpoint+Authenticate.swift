//
//  HTTPClient+Endpoint+Authenticate.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum Authenticate: PolarisEndpoint {
        
        case patron
        case staffUser
        
        var string: String {
            switch self {
            case .patron:
                return basePublic + "/authenticator/patron"
                
            case .staffUser:
                return baseProtected + "/authenticator/staff"
            }
        }
    }
}
