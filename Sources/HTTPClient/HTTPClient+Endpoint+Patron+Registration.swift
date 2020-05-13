//
//  HTTPClient+Endpoint+Patron+Registration.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Registration: PolarisEndpoint {
    
        case create
        case update(String)
        
        var string: String {
            switch self {
            case .create:
                return HTTPClient.Endpoint.basePublic + "/patron"
                
            case .update(let barcode):
                return HTTPClient.Endpoint.basePublic + "/patron/\(barcode)"
            }
        }
    }
}
