//
//  HTTPClient+Endpoint+Item.swift
//  Polaris
//
//  Created by Andrew Despres on 5/13/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum Item: PolarisEndpoint {
    
        case renew(String, Int)
        case renewAll(String)
        case updateBarcode(Int)
        
        var string: String {
            switch self {
            case .renew(let barcode, let ID):
                return basePublic + "/patron/\(barcode)/itemsout/\(ID)"
                
            case .renewAll(let barcode):
                return basePublic + "/patron/\(barcode)/itemsout/0"
                
            case .updateBarcode(let ID):
                return baseProtected + "/\(accessToken)/cataloging/items/\(ID)/barcode"
            }
        }
    }
}
