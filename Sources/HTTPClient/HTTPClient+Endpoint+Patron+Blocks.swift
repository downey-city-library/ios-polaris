//
//  HTTPClient+Endpoint+Patron+Blocks.swift
//  Polaris
//
//  Created by Andrew Despres on 5/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Blocks: PolarisEndpoint {
    
        case circulation(String)
        case create(String)
        case renewal(Int)
        
        var string: String {
            switch self {
            case .circulation(let barcode):
                return HTTPClient.Endpoint.basePublic + "/patron/\(barcode)/circulationblocks"
                
            case .create(let barcode):
                return HTTPClient.Endpoint.baseProtected + "/\(accessToken)/patron/\(barcode)/blocks"
                
            case .renewal(let ID):
                return HTTPClient.Endpoint.baseProtected + "/\(accessToken)/patron/\(ID)/renewblocks"
            }
        }
    }
}
