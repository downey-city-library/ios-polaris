//
//  HTTPClient+Endpoint.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient {
    
    struct Endpoint {
        
        static let basePublic = PolarisConfiguration.shared.url.public
        static let baseProtected = PolarisConfiguration.shared.url.protected
    }
}
